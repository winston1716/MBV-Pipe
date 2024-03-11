#! /bin/bash

source dwi-pipe.cfg

dwi_data_dir=$1
fa_dtifit_fpath=${dwi_data_dir}/'dtifit/dti_FA.nii.gz'
sub_field=$(echo ${dwi_data_dir} | rev | cut -d'/' -f3 | rev)
ses_field=$(echo ${dwi_data_dir} | rev | cut -d'/' -f2 | rev)
fa_tbss_fpath=${tbss_dir}/${sub_field}'_'${ses_field}'_FA.nii.gz'

if [ ! -d ${tbss_dir} ]; then
    mkdir -p ${tbss_dir}
fi
if [ -f ${fa_dtifit_fpath} ]; then
    cp -r ${fa_dtifit_fpath} ${fa_tbss_fpath}
else
    echo ${fa_dtifit_fpath} 'is not exist'
fi