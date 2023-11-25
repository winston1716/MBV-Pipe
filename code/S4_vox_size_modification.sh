#! /bin/bash
source mbv-pipe.cfg

sub_i_T2_brain_dir=$1
T2_brain_raw_res_dir=${sub_i_T2_brain_dir}/'brain_raw_res'
T2_brain_new_res_dir=${sub_i_T2_brain_dir}/'brain_'${new_vox_size_iso}'mm'
if [ ! -d ${T2_brain_raw_res_dir} ]; then
    mkdir -p ${T2_brain_raw_res_dir}
fi
if [ ! -d ${T2_brain_new_res_dir} ]; then
    mkdir -p ${T2_brain_new_res_dir}
fi
# raw resolution brain
cp -r ${sub_i_T2_brain_dir}/${T2_invivo_basename}'_N4_brain'${nii_ext} ${T2_brain_raw_res_dir}/${T2_invivo_basename}${nii_ext}
cp -r ${sub_i_T2_brain_dir}/${T2_perfused_basename}'_N4_brain'${nii_ext} ${T2_brain_raw_res_dir}/${T2_perfused_basename}${nii_ext}
cp -r ${sub_i_T2_brain_dir}/${T2_fixed_basename}'_N4_brain'${nii_ext} ${T2_brain_raw_res_dir}/${T2_fixed_basename}${nii_ext}

# new resolution brain
cp -r ${T2_brain_raw_res_dir}/* ${T2_brain_new_res_dir}/

matlab -nodisplay -r "run_vox_size_modification('${T2_brain_new_res_dir}', '${new_vox_size_iso}', '${save_raw_res_files_flag}'); exit();"

if [ -n $2 ]; then
    sub_i_T2_reg_dir=$2
    mkdir -p ${sub_i_T2_reg_dir}
    cp -r ${T2_brain_raw_res_dir} ${sub_i_T2_reg_dir}/
    cp -r ${T2_brain_new_res_dir} ${sub_i_T2_reg_dir}/
fi