#! /bin/bash

source mbv-pipe.cfg
export PATH=${PATH}:${PWD}

sub_dnames=($(ls -d ${data_dir}/sub-*))
sub_dnames_base=()
for dir in "${sub_dnames[@]}"; do
    sub_dnames_base+=("$(basename "$dir")")
done

# sub_dnames_base=('sub-003')  # just for test

for sub_i in ${sub_dnames_base[@]}; do
    sub_i_dir=${data_dir}/${sub_i}
    echo ${sub_i_dir}
    sub_i_T2_reoriented_dir=${sub_i_dir}/T2_reoriented
    sub_i_T2_brain_dir=${sub_i_dir}/T2_brain
    sub_i_T2_reg_dir=${sub_i_dir}/T2_reg
    sub_i_T2_reg_1_dir=${sub_i_T2_reg_dir}/'brain_2mm'
    sub_i_T2_reg_2_dir=${sub_i_T2_reg_dir}/'brain_raw_res'
    sub_i_T2_vbm_dir=${sub_i_dir}/'T2_vbm'
    sub_i_T2_vbm_corrected_dir=${sub_i_dir}/'T2_vbm_corrected'
    sub_i_T2_results_dir=${sub_i_dir}/'T2_results'
    sub_i_T2_results_corrected_dir=${sub_i_dir}/'T2_results_corrected'

:<<COMMENT
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

    # --- S5_3. anntreg2sbj ---
    S5_3_anntreg2sbj.sh ${sub_i_T2_reg_2_dir}

    # --- S6_1. vbm analysis ---
    S6_1_vbm_analysis.sh ${sub_i_T2_reg_1_dir} ${sub_i_T2_vbm_dir}

    # # --- S6_1_a. vbm mask corrected
    # S6_1_a_vbm_correct.sh ${sub_i_T2_vbm_dir} ${sub_i_T2_vbm_corrected_dir}

    # # --- S6_2. roi stats ---
    # S6_2_roi_stats.sh ${sub_i_T2_reg_2_dir} ${sub_i_T2_results_dir}

    # # --- S7_1. save vbm results
    # S7_1_save_vbm_results.sh ${sub_i_T2_vbm_dir} ${sub_i_T2_results_dir}

    # # --- S7_1_a. save vbm correct results
    # S7_1_save_vbm_results.sh ${sub_i_T2_vbm_corrected_dir} ${sub_i_T2_results_corrected_dir}
COMMENT
done


:<<COMMENT
# --- S7. run dartel ---
S7_dartel.sh ${data_dir} ${dartel_tpm_dir}
COMMENT


for sub_i in ${sub_dnames_base[@]}; do
    sub_i_dir=${data_dir}/${sub_i}
    echo ${sub_i_dir}
    sub_i_T2_reoriented_dir=${sub_i_dir}/T2_reoriented
    sub_i_T2_brain_dir=${sub_i_dir}/T2_brain
    sub_i_T2_reg_dir=${sub_i_dir}/T2_reg
    sub_i_T2_reg_1_dir=${sub_i_T2_reg_dir}/'brain_2mm'
    sub_i_T2_reg_2_dir=${sub_i_T2_reg_dir}/'brain_raw_res'
    sub_i_T2_vbm_dir=${sub_i_dir}/'T2_vbm'
    sub_i_T2_vbm_corrected_dir=${sub_i_dir}/'T2_vbm_corrected'
    sub_i_T2_results_dir=${sub_i_dir}/'T2_results'
    sub_i_T2_results_corrected_dir=${sub_i_dir}/'T2_results_corrected'
    sub_i_T2_vbm_dartel_dir=${sub_i_dir}/'T2_vbm_dartel'
    sub_i_T2_vbm_dartel_results_dir=${sub_i_dir}/'T2_vbm_dartel_results' # for S9
    sub_i_T2_vbm_dartel_smoothed_results_dir=${sub_i_dir}/'T2_vbm_dartel_smoothed_results' # for S9

    # --- S8. vbm dartel ---
    # S8_vbm_dartel.sh ${sub_i_T2_reg_1_dir} ${sub_i_T2_vbm_dartel_dir} # 37min

    # --- S9. smooth ---
    S9_smooth.sh ${sub_i_T2_vbm_dartel_dir}

    # --- S9. save vbm dartel results ---
    # S9_save_vbm_dartel_results.sh ${sub_i_T2_vbm_dartel_dir} ${sub_i_T2_vbm_dartel_results_dir}

    # --- S10. save vbm dartel smoothed results ---
    S10_save_vbm_dartel_smoothed_results.sh ${sub_i_T2_vbm_dartel_dir} ${sub_i_T2_vbm_dartel_smoothed_results_dir}
done