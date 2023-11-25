#! /bin/bash
source mbv-pipe.cfg

sub_i_dir=$1
sub_i_T2_raw_dir=${sub_i_dir}/T2_raw
sub_i_T2_reoriented_dir=${sub_i_dir}/T2_reoriented
sub_i_T2_reoriented_tmp_dir=${sub_i_T2_reoriented_dir}/tmp
if [ ! -d ${sub_i_T2_reoriented_dir} ];then
    mkdir -p ${sub_i_T2_reoriented_dir}
fi
if [ ! -d ${sub_i_T2_reoriented_tmp_dir} ];then
    mkdir -p ${sub_i_T2_reoriented_tmp_dir}
fi

# invivo
T2_raw_invivo_fpath=${sub_i_T2_raw_dir}/${T2_invivo_basename}${nii_ext}
T2_reoriented_invivo_correct_ori_fpath=${sub_i_T2_reoriented_dir}/${T2_invivo_basename}'_correct_ori'${nii_ext}
T2_reoriented_invivo_fpath=${sub_i_T2_reoriented_dir}/${T2_invivo_basename}${nii_ext}
mri_convert --in_orientation ${in_orientation} ${T2_raw_invivo_fpath} ${T2_reoriented_invivo_correct_ori_fpath}
mri_convert --out_orientation ${out_orientation} ${T2_reoriented_invivo_correct_ori_fpath} ${T2_reoriented_invivo_fpath}
mv ${T2_reoriented_invivo_correct_ori_fpath} ${sub_i_T2_reoriented_tmp_dir}

# perfused
T2_raw_perfused_fpath=${sub_i_T2_raw_dir}/${T2_perfused_basename}${nii_ext}
T2_reoriented_perfused_correct_ori_fpath=${sub_i_T2_reoriented_dir}/${T2_perfused_basename}'_correct_ori'${nii_ext}
T2_reoriented_perfused_fpath=${sub_i_T2_reoriented_dir}/${T2_perfused_basename}${nii_ext}
mri_convert --in_orientation ${in_orientation} ${T2_raw_perfused_fpath} ${T2_reoriented_perfused_correct_ori_fpath}
mri_convert --out_orientation ${out_orientation} ${T2_reoriented_perfused_correct_ori_fpath} ${T2_reoriented_perfused_fpath}
mv ${T2_reoriented_perfused_correct_ori_fpath} ${sub_i_T2_reoriented_tmp_dir}

# fixed
T2_raw_fixed_fpath=${sub_i_T2_raw_dir}/${T2_fixed_basename}${nii_ext}
T2_reoriented_fixed_correct_ori_fpath=${sub_i_T2_reoriented_dir}/${T2_fixed_basename}'_correct_ori'${nii_ext}
T2_reoriented_fixed_fpath=${sub_i_T2_reoriented_dir}/${T2_fixed_basename}${nii_ext}
mri_convert --in_orientation ${in_orientation} ${T2_raw_fixed_fpath} ${T2_reoriented_fixed_correct_ori_fpath}
mri_convert --out_orientation ${out_orientation} ${T2_reoriented_fixed_correct_ori_fpath} ${T2_reoriented_fixed_fpath}
mv ${T2_reoriented_fixed_correct_ori_fpath} ${sub_i_T2_reoriented_tmp_dir}