#! /bin/bash
source mbv-pipe.cfg

sub_i_T2_vbm_dartel_dir=$1
sub_i_T2_vbm_dartel_smoothed_results_dir=$2

if [ ! -d ${sub_i_T2_vbm_dartel_smoothed_results_dir} ]; then
    mkdir -p ${sub_i_T2_vbm_dartel_smoothed_results_dir}
fi

matlab -nodisplay -r "run_smoothed_analysis('${sub_i_T2_vbm_dartel_dir}', '${scale_factor}'); exit();"

cp -r ${sub_i_T2_vbm_dartel_dir}/${T2_invivo_basename}'_smoothed_volume_stats.mat' ${sub_i_T2_vbm_dartel_smoothed_results_dir}/
cp -r ${sub_i_T2_vbm_dartel_dir}/${T2_perfused_basename}'_smoothed_volume_stats.mat' ${sub_i_T2_vbm_dartel_smoothed_results_dir}/
cp -r ${sub_i_T2_vbm_dartel_dir}/${T2_fixed_basename}'_smoothed_volume_stats.mat' ${sub_i_T2_vbm_dartel_smoothed_results_dir}/

matlab -nodisplay -r "run_save_vbm_smoothed_results('${sub_i_T2_vbm_dartel_dir}', '${sub_i_T2_vbm_dartel_smoothed_results_dir}'); exit;"