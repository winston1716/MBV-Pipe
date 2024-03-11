#! /bin/bash

source dwi-pipe.cfg

if [ ! -d ${tbss_reoriented_dir} ]; then
    mkdir -p ${tbss_reoriented_dir}
fi

fa_tbss_fnames=($(ls ${tbss_dir}))
i=0
for fa_tbss_i in ${fa_tbss_fnames[@]}; do
    fa_tbss_i_fpath=${tbss_dir}/${fa_tbss_i}
    fa_tbss_reoriented_i_correct_ori_fpath=${tbss_reoriented_dir}/'tmp_correct_ori_'${fa_tbss_i}
    fa_tbss_reoriented_i_fpath=${tbss_reoriented_dir}/${fa_tbss_i}
    mri_convert --in_orientation ${in_orientation} ${fa_tbss_i_fpath} ${fa_tbss_reoriented_i_correct_ori_fpath}
    mri_convert --out_orientation ${out_orientation} ${fa_tbss_reoriented_i_correct_ori_fpath} ${fa_tbss_reoriented_i_fpath}
    rm -rf ${fa_tbss_reoriented_i_correct_ori_fpath}
done

cd ${tbss_reoriented_dir}
tbss_1_preproc *.nii.gz # OK
tbss_2_reg -t ${DSURQE_brain_fpath}
# tbss_3_postreg -S
# tbss_4_prestats 0.2

