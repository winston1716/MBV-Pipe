#! /bin/bash

source mbv-pipe.cfg

sub_i_T2_reoriented_dir=$1
sub_i_T2_brain_dir=$2

if [ ! -d ${sub_i_T2_brain_dir} ]; then
    mkdir -p ${sub_i_T2_brain_dir}
fi

# invivo
T2_invivo_input_img=${sub_i_T2_reoriented_dir}/${T2_invivo_basename}${nii_ext}
T2_invivo_output_img=${sub_i_T2_brain_dir}/${T2_invivo_basename}'_N4'${nii_ext}
N4BiasFieldCorrection -d ${n_dim} -s ${shrink_factor} -b ${bspline_order} -i ${T2_invivo_input_img} -o ${T2_invivo_output_img}

# perfused
T2_perfused_input_img=${sub_i_T2_reoriented_dir}/${T2_perfused_basename}${nii_ext}
T2_perfused_output_img=${sub_i_T2_brain_dir}/${T2_perfused_basename}'_N4'${nii_ext}
N4BiasFieldCorrection -d ${n_dim} -s ${shrink_factor} -b ${bspline_order} -i ${T2_perfused_input_img} -o ${T2_perfused_output_img}

# fixed
T2_fixed_input_img=${sub_i_T2_reoriented_dir}/${T2_fixed_basename}${nii_ext}
T2_fixed_output_img=${sub_i_T2_brain_dir}/${T2_fixed_basename}'_N4'${nii_ext}
N4BiasFieldCorrection -d ${n_dim} -s ${shrink_factor} -b ${bspline_order} -i ${T2_fixed_input_img} -o ${T2_fixed_output_img}

