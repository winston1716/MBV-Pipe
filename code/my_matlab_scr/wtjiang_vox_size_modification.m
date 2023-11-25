function wtjiang_vox_size_modification(raw_nii_path, new_nii_path, new_vox_size)
% This function is used to modify the voxel size in the header file 
% of the nifti file
% input: 
%       raw_nii_path: the path of raw nifti file
%       new_nii_path: the path of new nifti file
% output:
%       None
% Notes:
%       1. The input file's dimension must be 3, Otherwise you will 
% encounter errors(i.e., Scalar structure required for this assignment).
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% logs:
%       11-07-23: created
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wentao jiang, winston.ia@outlook.com

raw_nii_info = spm_vol(raw_nii_path);
data = spm_read_vols(raw_nii_info);

new_nii_info = spm_vol(raw_nii_path);

new_nii_info.mat(1:3, 1:3) = diag(new_vox_size);
new_nii_info.fname = new_nii_path;

spm_write_vol(new_nii_info, data);

end

