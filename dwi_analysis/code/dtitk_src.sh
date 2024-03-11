#! /bin/bash

dir_reg=$(dirname $0)
subjs_txt_fpath=${dir_reg}/'subjs.txt'
subj_fpath=($(find $(dirname "$0") -maxdepth 1 -type f -name "ses*.nii.gz"))
tmpl_fpath=${dir_reg}/'template.nii.gz'
tmpl_affine_1_fpath=${dir_reg}/'mean_affine1.nii.gz'
tmpl_affine_1_tr_fpath=${dir_reg}/'mean_affine1_tr.nii.gz'
tmpl_diff_1_fpath=${dir_reg}/'mean_diffeomorphic_initial1.nii.gz'
subjs_aff_txt_fpath=${dir_reg}/'subjs_aff.txt'
aff_txt_fpath=${dir_reg}/'affine.txt'
diffeo_txt_fpath=${dir_reg}/'diffeo.txt'
mask_fpath=${dir_reg}/'mask.nii.gz'
mean_final_fpath=${dir_reg}/'mean_final.nii.gz'
subjs_aff_diffeo_fpath=${dir_reg}/'subjs_aff_diffeo.txt'
mean_final_hr_fpath=${dir_reg}/'mean_final_high_res.nii.gz'
mean_final_high_res_fa_fpath=${dir_reg}/'mean_final_high_res_fa.nii.gz'
mean_FA_fpath=${dir_reg}/'mean_FA.nii.gz'
mean_FA_mask_fpath=${dir_reg}/'mean_FA_mask.nii.gz'
mean_FA_skeleton_fpath=${dir_reg}/'mean_FA_skeleton.nii.gz'
fa_files_txt_fpath=${dir_reg}/'fa_files.txt'
fa_files_sorted_txt_fpath=${dir_reg}/'fa_sorted_files.txt'
all_FA_fpath=${dir_reg}/'all_FA.nii.gz'
new_tbss_dir=${dir_reg}/'tbss'
tbss_stats_dir=${new_tbss_dir}/'stats'
all_FA_skeletonised_fpath=${tbss_stats_dir}/'all_FA_skeletonised.nii.gz'
# mean_FA_skeleton


# run only once !!!
# > ${subjs_txt_fpath}
# for subj_i in ${subj_fpath[@]}; do
#     subj_i_bname=$(basename ${subj_i})
#     echo ${subj_i_bname} >> ${subjs_txt_fpath}
# done

# rm -rf ${dir_reg}/*aff*
# rm -rf ${dir_reg}/*rig*
# dti_rigid_population ${tmpl_fpath} ${subjs_txt_fpath} EDS 3  # 5min
# dti_affine_population ${tmpl_fpath} ${subjs_txt_fpath} EDS 1 # 10min

# TVtool -in ${tmpl_affine_1_fpath} -tr
# BinaryThresholdImageFilter ${tmpl_affine_1_tr_fpath} ${mask_fpath} 0.2 100 1 0

# dti_diffeomorphic_population ${tmpl_affine_1_fpath} ${subjs_aff_txt_fpath} ${mask_fpath} 0.002 # 3hr
# dti_diffeomorphic_sn ${tmpl_diff_1_fpath} ${subjs_aff_txt_fpath} ${mask_fpath} 1 0.002 # 11 hours, 25 minutes

aff_txt_data=$(cat ${aff_txt_fpath})

# for aff_i in ${aff_txt_data}; do
#     subj_aff_i=${aff_i}
#     # echo ${subj_aff_i}
#     subj_aff_diffeo_i=${aff_i:0:20}'_aff_diffeo.df.nii.gz'
#     # echo ${subj_aff_diffeo_i}
#     subj_comb_i_fname=${aff_i:0:20}'_combined.df.nii.gz'
#     subj_comb_i_fpath=${dir_reg}/${subj_comb_i_fname}
#     # echo ${subj_comb_i_fpath}
#     dfRightComposeAffine -aff ${subj_aff_i} -df ${subj_aff_diffeo_i} -out ${subj_comb_i_fpath}
# done

# cp -r ${tmpl_diff_1_fpath} ${mean_final_fpath}
# dti_warp_to_template_group ${subjs_txt_fpath} ${mean_final_fpath} 0.2 0.2 0.2

# TVMean -in ${subjs_aff_diffeo_fpath} -out ${mean_final_hr_fpath}

# TVtool -in ${mean_final_hr_fpath} -fa
# mv ${mean_final_high_res_fa_fpath} ${mean_FA_fpath}

# tbss_skeleton -i ${mean_FA_fpath} -o mean_FA_skeleton

# for aff_i in ${aff_txt_data}; do
#     subj_aff_i=${aff_i}
#     # echo ${subj_aff_i}
#     subj_diffeo_i=${aff_i:0:20}'_diffeo.nii.gz'
#     if [ -f ${subj_diffeo_i} ]; then
#         TVtool -in ${subj_diffeo_i} -fa
#     fi
# done

# > ${fa_files_txt_fpath}
# for aff_i in ${aff_txt_data}; do
#     subj_aff_i=${aff_i}
#     subj_diffeo_fa_i=${aff_i:0:20}'_diffeo_fa.nii.gz'
#     echo ${subj_diffeo_fa_i} >> ${fa_files_txt_fpath}
# done

# > ${fa_files_sorted_txt_fpath}
# sort ${fa_files_txt_fpath} > ${fa_files_sorted_txt_fpath}

# fslmerge -t ${all_FA_fpath} $(cat ${fa_files_sorted_txt_fpath})

# fslmaths ${all_FA_fpath} -max 0 -Tmin -bin ${mean_FA_mask_fpath} -odt char

# if [ ! -d ${tbss_stats_dir} ]; then
#     mkdir -p ${tbss_stats_dir}
# fi

# cp -r ${all_FA_fpath} ${tbss_stats_dir}/
# cp -r ${mean_FA_mask_fpath} ${tbss_stats_dir}/
# cp -r ${mean_FA_skeleton_fpath} ${tbss_stats_dir}/
# cp -r ${mean_FA_fpath} ${tbss_stats_dir}/