#! /bin/bash
source mbv-pipe.cfg

sub_i_T2_reg_1_dir=$1

# invivo
reg_invol_T2_invivo_fpath=${sub_i_T2_reg_1_dir}/${T2_invivo_basename}'_'${new_vox_size_iso}'mm'${nii_ext}
reg_outvol_T2_invivo_gz_fpath=${sub_i_T2_reg_1_dir}/${T2_invivo_basename}'_reg2tpm'${nii_gz_ext}
reg_outvol_T2_invivo_fpath=${sub_i_T2_reg_1_dir}/${T2_invivo_basename}'_reg2tpm'${nii_ext}
reg_T2_invivo_omat=${sub_i_T2_reg_1_dir}/${T2_invivo_basename}'_reg2tpm.mat'

flirt -in ${reg_invol_T2_invivo_fpath} -ref ${TPM_GM_x10_fpath} -out ${reg_outvol_T2_invivo_gz_fpath} -omat ${reg_T2_invivo_omat} -dof ${degree_of_freedom} -cost ${cost_func}

if [ -f ${reg_outvol_T2_invivo_gz_fpath} ]; then
    gunzip -f ${reg_outvol_T2_invivo_gz_fpath}
fi

# perfused
reg_invol_T2_perfused_fpath=${sub_i_T2_reg_1_dir}/${T2_perfused_basename}'_'${new_vox_size_iso}'mm'${nii_ext}
reg_outvol_T2_perfused_gz_fpath=${sub_i_T2_reg_1_dir}/${T2_perfused_basename}'_reg2tpm'${nii_gz_ext}
reg_outvol_T2_perfused_fpath=${sub_i_T2_reg_1_dir}/${T2_perfused_basename}'_reg2tpm'${nii_ext}
reg_T2_perfused_omat=${sub_i_T2_reg_1_dir}/${T2_perfused_basename}'_reg2tpm.mat'

flirt -in ${reg_invol_T2_perfused_fpath} -ref ${TPM_GM_x10_fpath} -out ${reg_outvol_T2_perfused_gz_fpath} -omat ${reg_T2_perfused_omat} -dof ${degree_of_freedom} -cost ${cost_func}

if [ -f ${reg_outvol_T2_perfused_gz_fpath} ]; then
    gunzip -f ${reg_outvol_T2_perfused_gz_fpath}
fi

# fixed
reg_invol_T2_fixed_fpath=${sub_i_T2_reg_1_dir}/${T2_fixed_basename}'_'${new_vox_size_iso}'mm'${nii_ext}
reg_outvol_T2_fixed_gz_fpath=${sub_i_T2_reg_1_dir}/${T2_fixed_basename}'_reg2tpm'${nii_gz_ext}
reg_outvol_T2_fixed_fpath=${sub_i_T2_reg_1_dir}/${T2_fixed_basename}'_reg2tpm'${nii_ext}
reg_T2_fixed_omat=${sub_i_T2_reg_1_dir}/${T2_fixed_basename}'_reg2tpm.mat'

flirt -in ${reg_invol_T2_fixed_fpath} -ref ${TPM_GM_x10_fpath} -out ${reg_outvol_T2_fixed_gz_fpath} -omat ${reg_T2_fixed_omat} -dof ${degree_of_freedom} -cost ${cost_func}

if [ -f ${reg_outvol_T2_fixed_gz_fpath} ]; then
    gunzip -f ${reg_outvol_T2_fixed_gz_fpath}
fi