function matlabbatch = wtjiang_smooth_job(mwc_matrix, smooth_size)
    matlabbatch{1}.spm.spatial.smooth.data = mwc_matrix;
    % matlabbatch{1}.spm.spatial.smooth.data = {
    %                                         '/n02dat01/users/wtjiang/Workspace/MBV-Pipe/data/sub-002/T2_vbm_dartel/mwc1T2_fixed_reg2tpm.nii,1'
    %                                         '/n02dat01/users/wtjiang/Workspace/MBV-Pipe/data/sub-002/T2_vbm_dartel/mwc1T2_invivo_reg2tpm.nii,1'
    %                                         '/n02dat01/users/wtjiang/Workspace/MBV-Pipe/data/sub-002/T2_vbm_dartel/mwc1T2_perfused_reg2tpm.nii,1'
    %                                         '/n02dat01/users/wtjiang/Workspace/MBV-Pipe/data/sub-002/T2_vbm_dartel/mwc2T2_fixed_reg2tpm.nii,1'
    %                                         '/n02dat01/users/wtjiang/Workspace/MBV-Pipe/data/sub-002/T2_vbm_dartel/mwc2T2_invivo_reg2tpm.nii,1'
    %                                         '/n02dat01/users/wtjiang/Workspace/MBV-Pipe/data/sub-002/T2_vbm_dartel/mwc2T2_perfused_reg2tpm.nii,1'
    %                                         '/n02dat01/users/wtjiang/Workspace/MBV-Pipe/data/sub-002/T2_vbm_dartel/mwc3T2_fixed_reg2tpm.nii,1'
    %                                         '/n02dat01/users/wtjiang/Workspace/MBV-Pipe/data/sub-002/T2_vbm_dartel/mwc3T2_invivo_reg2tpm.nii,1'
    %                                         '/n02dat01/users/wtjiang/Workspace/MBV-Pipe/data/sub-002/T2_vbm_dartel/mwc3T2_perfused_reg2tpm.nii,1'
    %                                         };
    matlabbatch{1}.spm.spatial.smooth.fwhm = [smooth_size smooth_size smooth_size];
    matlabbatch{1}.spm.spatial.smooth.dtype = 0;
    matlabbatch{1}.spm.spatial.smooth.im = 0;
    matlabbatch{1}.spm.spatial.smooth.prefix = 's';
end