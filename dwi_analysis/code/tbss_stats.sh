#! /bin/bash

tbss_dir=$(dirname $0)
tbss_stats_dir=${tbss_dir}/'stats'
mean_FA_mask_fpath=${tbss_stats_dir}/'mean_FA_mask.nii.gz'
all_FA_skeletonised_fpath=${tbss_stats_dir}/'all_FA_skeletonised.nii.gz'
design_mat_fpath=${tbss_dir}/'design.mat'
design_con_fpath=${tbss_dir}/'design.con'

if [ -d ${tbss_stats_dir} ]; then
    echo ${tbss_stats_dir}
fi

tbss_4_prestats 0.2

randomise -i ${all_FA_skeletonised_fpath} -o tbss -m ${mean_FA_mask_fpath} -d ${design_mat_fpath} -t ${design_con_fpath} -n 500 --T2