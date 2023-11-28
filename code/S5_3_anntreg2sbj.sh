#! /bin/bash
source mbv-pipe.cfg

sub_i_T2_reg_2_dir=$1

# invivo
T2_invivo_input_fpath=${sub_i_T2_reg_2_dir}/${T2_invivo_basename}${nii_ext}
prefix_invivo_out=${T2_invivo_basename}'reg2ara_'
T2_invivo_annt_fpath=${sub_i_T2_reg_2_dir}/${T2_invivo_basename}'_annt'${nii_ext}
T2_invivoreg2ara_0GenericAffine_mat=${sub_i_T2_reg_2_dir}/${prefix_invivo_out}'0GenericAffine.mat'
T2_invivoreg2ara_1InverseWarp=${sub_i_T2_reg_2_dir}/${prefix_invivo_out}'1InverseWarp.nii.gz'

antsApplyTransforms -d ${nii_dim} -i ${ara_annt_fpath} -r ${T2_invivo_input_fpath} -o ${T2_invivo_annt_fpath} -t [${T2_invivoreg2ara_0GenericAffine_mat},1] -t ${T2_invivoreg2ara_1InverseWarp} -n ${interpolation_method}

# perfused
T2_perfused_input_fpath=${sub_i_T2_reg_2_dir}/${T2_perfused_basename}${nii_ext}
prefix_perfused_out=${T2_perfused_basename}'reg2ara_'
T2_perfused_annt_fpath=${sub_i_T2_reg_2_dir}/${T2_perfused_basename}'_annt'${nii_ext}
T2_perfusedreg2ara_0GenericAffine_mat=${sub_i_T2_reg_2_dir}/${prefix_perfused_out}'0GenericAffine.mat'
T2_perfusedreg2ara_1InverseWarp=${sub_i_T2_reg_2_dir}/${prefix_perfused_out}'1InverseWarp.nii.gz'

antsApplyTransforms -d ${nii_dim} -i ${ara_annt_fpath} -r ${T2_perfused_input_fpath} -o ${T2_perfused_annt_fpath} -t [${T2_perfusedreg2ara_0GenericAffine_mat},1] -t ${T2_perfusedreg2ara_1InverseWarp} -n ${interpolation_method}

# fixed
T2_fixed_input_fpath=${sub_i_T2_reg_2_dir}/${T2_fixed_basename}${nii_ext}
prefix_fixed_out=${T2_fixed_basename}'reg2ara_'
T2_fixed_annt_fpath=${sub_i_T2_reg_2_dir}/${T2_fixed_basename}'_annt'${nii_ext}
T2_fixedreg2ara_0GenericAffine_mat=${sub_i_T2_reg_2_dir}/${prefix_fixed_out}'0GenericAffine.mat'
T2_fixedreg2ara_1InverseWarp=${sub_i_T2_reg_2_dir}/${prefix_fixed_out}'1InverseWarp.nii.gz'

antsApplyTransforms -d ${nii_dim} -i ${ara_annt_fpath} -r ${T2_fixed_input_fpath} -o ${T2_fixed_annt_fpath} -t [${T2_fixedreg2ara_0GenericAffine_mat},1] -t ${T2_fixedreg2ara_1InverseWarp} -n ${interpolation_method}