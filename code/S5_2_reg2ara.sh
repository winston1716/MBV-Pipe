#! /bin/bash
source mbv-pipe.cfg

sub_i_T2_reg_2_dir=$1

#invivo
T2_invivo_input_fpath=${sub_i_T2_reg_2_dir}/${T2_invivo_basename}${nii_ext}
prefix_invivo_out=${T2_invivo_basename}'reg2ara_'

antsRegistrationSyNQuick.sh -d ${nii_dim} -n ${num_cpu} -f ${ara_tmpl_fpath} -m ${T2_invivo_input_fpath} -o ${sub_i_T2_reg_2_dir}/${prefix_invivo_out}



#perfused
T2_perfused_input_fpath=${sub_i_T2_reg_2_dir}/${T2_perfused_basename}${nii_ext}
prefix_perfused_out=${T2_perfused_basename}'reg2ara_'

antsRegistrationSyNQuick.sh -d ${nii_dim} -n ${num_cpu} -f ${ara_tmpl_fpath} -m ${T2_perfused_input_fpath} -o ${sub_i_T2_reg_2_dir}/${prefix_perfused_out}

#fixed
T2_fixed_input_fpath=${sub_i_T2_reg_2_dir}/${T2_fixed_basename}${nii_ext}
prefix_fixed_out=${T2_fixed_basename}'reg2ara_'

antsRegistrationSyNQuick.sh -d ${nii_dim} -n ${num_cpu} -f ${ara_tmpl_fpath} -m ${T2_fixed_input_fpath} -o ${sub_i_T2_reg_2_dir}/${prefix_fixed_out}