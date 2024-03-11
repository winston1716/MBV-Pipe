#! /bin/bash

source dwi-pipe.cfg

dwi_data_dir=$1
dtifit_dir=${dwi_data_dir}/'dtifit'
ses_field=$(echo ${dwi_data_dir} | rev | cut -d'/' -f2 | rev)
sub_field=$(echo ${dwi_data_dir} | rev | cut -d'/' -f3 | rev)
dtitk_dtifit_dir=${dtitk_dir}/${ses_field}'_'${sub_field}'_dtifit'
dtitk_raw_fpath=${dtitk_dtifit_dir}/'dtitk_raw.nii.gz'
dtitk_scaled_fpath=${dtitk_dtifit_dir}/'dtitk_tensor.nii.gz'
dtitk_tensor_fpath=${dtitk_tensor_dir}/${ses_field}'_'${sub_field}'_tensor.nii.gz'

if [ ! -d ${dtitk_dtifit_dir} ]; then
    mkdir -p ${dtitk_dtifit_dir}
fi
if [ ! -d ${dtitk_tensor_dir} ]; then
    mkdir -p ${dtitk_tensor_dir}
fi

if [ -d ${dtifit_dir} ]; then
    cp -r ${dtifit_dir}/* ${dtitk_dtifit_dir}
    cd ${dtitk_dtifit_dir}
    TVFromEigenSystem -basename 'dti' -type FSL -out ${dtitk_raw_fpath}
    TVtool -in ${dtitk_raw_fpath} -scale ${dtitk_b_scale_factor} -out ${dtitk_scaled_fpath}
    cp -r ${dtitk_scaled_fpath} ${dtitk_tensor_fpath}
fi


