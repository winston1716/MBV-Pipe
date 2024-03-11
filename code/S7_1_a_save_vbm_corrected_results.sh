#! /bin/bash
source mbv-pipe.cfg

sub_i_T2_vbm_corrected_dir=$1
sub_i_T2_results_corrected_dir=$2

if [ ! -d ${sub_i_T2_results_corrected_dir} ]; then
    mkdir -p ${sub_i_T2_results_corrected_dir}
fi

cp -r ${sub_i_T2_vbm_corrected_dir}/${T2_invivo_basename}'_volume_stats.mat' ${sub_i_T2_results_corrected_dir}/
cp -r ${sub_i_T2_vbm_corrected_dir}/${T2_perfused_basename}'_volume_stats.mat' ${sub_i_T2_results_corrected_dir}/
cp -r ${sub_i_T2_vbm_corrected_dir}/${T2_fixed_basename}'_volume_stats.mat' ${sub_i_T2_results_corrected_dir}/


matlab -nodisplay -r "run_save_vbm_results('${sub_i_T2_vbm_corrected_dir}', '${sub_i_T2_results_corrected_dir}'); exit;"