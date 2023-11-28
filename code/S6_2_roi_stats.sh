#! /bin/bash
source mbv-pipe.cfg

sub_i_T2_reg_2_dir=$1
sub_i_T2_results_dir=$2

if [ ! -d ${sub_i_T2_results_dir} ]; then
    mkdir -p ${sub_i_T2_results_dir}
fi

matlab -nodisplay -r "run_roi_stats('${sub_i_T2_reg_2_dir}', '${roi_acronym_fpath}', '${sub_i_T2_results_dir}'); exit;"