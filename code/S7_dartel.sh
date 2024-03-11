#! /bin/bash
source mbv-pipe.cfg

data_dir=$1
dartel_tpm_dir=$2

if [ ! -d ${dartel_tpm_dir} ]; then
    mkdir -p ${dartel_tpm_dir}
fi
matlab -nodisplay -r "run_dartel('${data_dir}', '${dartel_tpm_dir}'); exit;"

template_6_fpath=${dartel_tpm_dir}/'Template_6.nii'
fslsplit ${template_6_fpath} ${dartel_tpm_dir}/'TPM_' -t
gunzip ${dartel_tpm_dir}/*
mv ${dartel_tpm_dir}/'TPM_0000.nii' ${dartel_tpm_GM_fpath}
mv ${dartel_tpm_dir}/'TPM_0001.nii' ${dartel_tpm_WM_fpath}
mv ${dartel_tpm_dir}/'TPM_0002.nii' ${dartel_tpm_CSF_fpath}