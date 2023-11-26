#! /bin/bash
source mbv-pipe.cfg

sub_i_T2_reg_1_dir=$1
sub_i_T2_vbm_dir=$2

if [ ! -d ${sub_i_T2_vbm_dir} ]; then
    mkdir -p ${sub_i_T2_vbm_dir}
fi

# copy reg*.nii files
# invivo
T2_invivo_vbm_input_fpath=${sub_i_T2_vbm_dir}/${T2_invivo_basename}'_reg2tpm'${nii_ext}
cp -r ${sub_i_T2_reg_1_dir}/${T2_invivo_basename}'_reg2tpm'${nii_ext} ${T2_invivo_vbm_input_fpath}

# perfused
T2_perfused_vbm_input_fpath=${sub_i_T2_vbm_dir}/${T2_perfused_basename}'_reg2tpm'${nii_ext}
cp -r ${sub_i_T2_reg_1_dir}/${T2_perfused_basename}'_reg2tpm'${nii_ext} ${T2_perfused_vbm_input_fpath}

# fixed
T2_fixed_vbm_input_fpath=${sub_i_T2_vbm_dir}/${T2_fixed_basename}'_reg2tpm'${nii_ext}
cp -r ${sub_i_T2_reg_1_dir}/${T2_fixed_basename}'_reg2tpm'${nii_ext} ${T2_fixed_vbm_input_fpath}

# analysis based on spm old segment

# invivo
matlab -nodisplay -r "run_vbm_analysis('${T2_invivo_vbm_input_fpath}', '${TPM_x10_dir}', '${scale_factor}'); exit;"

# perfused
matlab -nodisplay -r "run_vbm_analysis('${T2_perfused_vbm_input_fpath}', '${TPM_x10_dir}', '${scale_factor}'); exit;"

# fixed
matlab -nodisplay -r "run_vbm_analysis('${T2_fixed_vbm_input_fpath}', '${TPM_x10_dir}', '${scale_factor}'); exit;"