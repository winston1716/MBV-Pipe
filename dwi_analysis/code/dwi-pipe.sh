#! /bin/bash

source dwi-pipe.cfg
export PATH=${PATH}:${PWD}

# sub_dir=$1
# sub_dir='/n02dat01/users/wtjiang/Workspace/MBV-Pipe/dwi_analysis/data/sub-003'

sub_dnames=($(ls -d ${data_dir}/sub-* | grep -v "${data_dir}\/sub-001"))
for sub_dir in ${sub_dnames[@]}; do
    for ses_i in ${ses_s[@]}; do
    dwi_data_dir=${sub_dir}/${ses_i}/'dwi'
    # # --- S1. Extract B0 brain images ---
    # S1.b0_brain_extraction.sh ${dwi_data_dir}
    # # --- S2. Eddy correction ---
    # S2.eddy_correction.sh ${dwi_data_dir}
    # # --- S3. Dtifit ---
    # S3.dtifit.sh ${dwi_data_dir}

    # --- S4. Prep for TBSS ---
    # S4.prep_for_tbss.sh ${dwi_data_dir}

    # --- S5. Prep for dtitk tbss ---
    S5.prep_for_dtitk_tbss.sh ${dwi_data_dir}
    done
done


