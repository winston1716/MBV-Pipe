#! /bin/bash
source mbv-pipe.cfg

sub_i_T2_vbm_dir=$1
sub_i_T2_vbm_corrected_dir=$2

if [ ! -d ${sub_i_T2_vbm_corrected_dir} ]; then
    mkdir -p ${sub_i_T2_vbm_corrected_dir}
fi

matlab -nodisplay -r "run_vbm_correct('${sub_i_T2_vbm_dir}', '${sub_i_T2_vbm_corrected_dir}', '${mask_fpath}', '${scale_factor}'); exit;"


