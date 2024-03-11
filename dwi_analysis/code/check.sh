#! /bin/bash

dir_check=$(dirname $0)
subjs_txt_fpath=${dir_check}/'subjs.txt'
wrong_value_fpath=${dir_check}/'wrong_value.txt'
> ${wrong_value_fpath}
# echo ${dir_check}
for sub_i in $(cat ${subjs_txt_fpath}); do
    sub_i_fpath=${dir_check}/${sub_i}
    sub_i_norm_fpath=$(echo ${sub_i_fpath} | sed -e 's/.nii.gz/_norm.nii.gz/')
    sub_i_spd_fpath=$(echo ${sub_i_fpath} | sed -e 's/.nii.gz/_spd.nii.gz/')
    TVtool -in ${sub_i_fpath} -norm
    SVtool -in ${sub_i_norm_fpath} -stats >> ${wrong_value_fpath}
    rm -rf ${sub_i_norm_fpath}
    # TVtool -in ${sub_i_fpath} -spd -out ${sub_i_spd_fpath}
    TVAdjustVoxelspace -in ${sub_i_fpath} -origin 0 0 0
done