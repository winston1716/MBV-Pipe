#! /bin/bash

source mbv-pipe.cfg
export PATH=${PATH}:${PWD}

sub_dnames=($(ls -d ${data_dir}/sub*))

sub_dnames=('sub-003')  # just for test

for sub_i in ${sub_dnames[@]}; do
    sub_i_dir=${data_dir}/${sub_i}
    sub_i_T2_reoriented_dir=${sub_i_dir}/T2_reoriented
    sub_i_T2_brain_dir=${sub_i_dir}/T2_brain
    sub_i_T2_reg_dir=${sub_i_dir}/T2_reg
    sub_i_T2_reg_1_dir=${sub_i_T2_reg_dir}/'brain_2mm'
    sub_i_T2_reg_2_dir=${sub_i_T2_reg_dir}/'brain_raw_res'
    sub_i_T2_vbm_dir=${sub_i_dir}/'T2_vbm'
    sub_i_T2_results_dir=${sub_i_dir}/'T2_results'

    # --- S1. reorientation ---
    S1_reorientation.sh ${sub_i_dir}

    # --- S2. N4 bias correction ---
    S2_N4_bias_correction.sh ${sub_i_T2_reoriented_dir} ${sub_i_T2_brain_dir}

    # --- S3. skull stripping ---
    S3_skull_stripping.sh ${sub_i_T2_brain_dir}

    # --- S4. vox size modification ---
    S4_vox_size_modification.sh ${sub_i_T2_brain_dir} ${sub_i_T2_reg_dir}

    # --- S5_1. reg2tpm ---
    S5_1_reg2tpm.sh ${sub_i_T2_reg_1_dir}

    # --- S5_2. reg2ara ---
    S5_2_reg2ara.sh ${sub_i_T2_reg_2_dir}

    # --- S6_1. vbm analysis ---
    S6_1_vbm_analysis.sh ${sub_i_T2_reg_1_dir} ${sub_i_T2_vbm_dir}

    # --- S7_1. save vbm results
    S7_1_save_vbm_results.sh ${sub_i_T2_vbm_dir} ${sub_i_T2_results_dir}
done