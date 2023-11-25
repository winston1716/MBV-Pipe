function run_PCNN3D(datpath)
    addpath('./PCNN3D_matlab');
    addpath('./PCNN3D_matlab/nifti_tools');
    BrSize=[300,550]; % brain size range for MOUSE (mm3).
    StrucRadius=3; % use =3 for low resolution, use 5 or 7 for highres data
    ZoomFactor=1; % resolution magnification factor

    %% run PCNN
    [nii] = load_untouch_nii(datpath);
    raw_img=nii.img;
    mtx=size(nii.img);
    if length(mtx)==4
        disp('Data is 4D, use the average image to generate mask')
        nii.img=mean(nii.img,4);
    end
    voxdim=nii.hdr.dime.pixdim(2:4);
    [I_border, G_I, optG] = PCNN3D(single(nii.img), StrucRadius, voxdim, BrSize*ZoomFactor^3);
    V=zeros(mtx);
    for n=1:mtx(3)
        V(:,:,n)=I_border{optG}{n};
    end
    
    %% save brain mask data
    % nii.img=V;
    % nii.hdr.dime.dim(1)=3; nii.hdr.dime.dim(5)=1;
    % nii.hdr.dime.datatype=2; nii.hdr.dime.bitpix=8; % save as unsigned char
    % p=strfind(datpath,'.nii');
    % save_untouch_nii(nii,[datpath(1:p-1),'_brainmask.nii']);
    
    %% save brain data
    nii.img=raw_img.*V;
    nii.hdr.dime.dim(1)=3; nii.hdr.dime.dim(5)=1;
    nii.hdr.dime.datatype=2; nii.hdr.dime.bitpix=8; % save as unsigned char
    p=strfind(datpath,'.nii');
    save_untouch_nii(nii,[datpath(1:p-1),'_brain.nii']);
end

