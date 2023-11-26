#! /bin/bash

source mbv-pipe.cfg

sub_i_T2_brain_dir=$1

# invivo
T2_invivo_nb_img=${sub_i_T2_brain_dir}/${T2_invivo_basename}'_N4'${nii_ext}
matlab -nodisplay -r "run_PCNN3D('${T2_invivo_nb_img}'); exit;"

# perfused
T2_perfused_nb_img=${sub_i_T2_brain_dir}/${T2_perfused_basename}'_N4'${nii_ext}
matlab -nodisplay -r "run_PCNN3D('${T2_perfused_nb_img}'); exit;"

# fixed
T2_fixed_nb_img=${sub_i_T2_brain_dir}/${T2_fixed_basename}'_N4'${nii_ext}
matlab -nodisplay -r "run_PCNN3D('${T2_fixed_nb_img}'); exit;"



:<<COMMENT
# perfused
T2_perfused_nb_img=${sub_i_T2_brain_dir}/${T2_perfused_basename}'_N4'${nii_ext}
T2_perfused_nb_img_in_atlasBREX_mouse_dir=${atlasBREX_mouse_dir}/${T2_perfused_basename}'_N4'${nii_ext}
T2_perfused_nb_img_input=${atlasBREX_mouse_dir}/${T2_perfused_basename}'_N4'${nii_gz_ext}
T2_perfused_nb_img_output=${atlasBREX_mouse_dir}/${T2_perfused_basename}'_N4_brain'${nii_gz_ext}
cd ${atlasBREX_mouse_dir}
cp -r ${T2_perfused_nb_img} ${T2_perfused_nb_img_in_atlasBREX_mouse_dir}
if [ -f ${T2_perfused_nb_img_in_atlasBREX_mouse_dir} ]; then
    gzip -f ${T2_perfused_nb_img_in_atlasBREX_mouse_dir}
fi
${atlasBREX_sh} -b ${b_mouse_T2w_fpath} -nb ${nb_mouse_T2w_fpath} -h ${T2_perfused_nb_img_input} -f ${perfused_threshold}
mv ${T2_perfused_nb_img_output} ${sub_i_T2_brain_dir}
gunzip -f ${sub_i_T2_brain_dir}/${T2_perfused_basename}'_N4_brain'${nii_gz_ext}
rm -rf ${T2_perfused_nb_img_input}
cd ${code_dir}

# fixed
T2_fixed_nb_img=${sub_i_T2_brain_dir}/${T2_fixed_basename}'_N4'${nii_ext}
T2_fixed_nb_img_in_atlasBREX_mouse_dir=${atlasBREX_mouse_dir}/${T2_fixed_basename}'_N4'${nii_ext}
T2_fixed_nb_img_input=${atlasBREX_mouse_dir}/${T2_fixed_basename}'_N4'${nii_gz_ext}
T2_fixed_nb_img_output=${atlasBREX_mouse_dir}/${T2_fixed_basename}'_N4_brain'${nii_gz_ext}
cd ${atlasBREX_mouse_dir}
cp -r ${T2_fixed_nb_img} ${T2_fixed_nb_img_in_atlasBREX_mouse_dir}
if [ -f ${T2_fixed_nb_img_in_atlasBREX_mouse_dir} ]; then
    gzip -f ${T2_fixed_nb_img_in_atlasBREX_mouse_dir}
fi
${atlasBREX_sh} -b ${b_mouse_T2w_fpath} -nb ${nb_mouse_T2w_fpath} -h ${T2_fixed_nb_img_input} -f ${fixed_threshold}
mv ${T2_fixed_nb_img_output} ${sub_i_T2_brain_dir}
gunzip -f ${sub_i_T2_brain_dir}/${T2_fixed_basename}'_N4_brain'${nii_gz_ext}
rm -rf ${T2_fixed_nb_img_input}
cd ${code_dir}
COMMENT