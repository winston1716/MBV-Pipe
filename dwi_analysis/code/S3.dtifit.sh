#! /bin/bash

source dwi-pipe.cfg

dwi_data_dir=$1
eddy_out_dir=${dwi_data_dir}/'eddy_out'
dtifit_dir=${dwi_data_dir}/'dtifit'

bvals_data_fapth=${dwi_data_dir}/'bvals'
nodif_brain_mask_gz_fpath=${dwi_data_dir}/'nodif_brain_mask.nii.gz'
eddy_corrected_data_fpath=${eddy_out_dir}/'eddy_corrected_data.nii.gz'
eddy_corrected_bvecs_fpath=${eddy_out_dir}/'eddy_corrected_data.eddy_rotated_bvecs'
eddy_corrected_bvecs_modi_nan_fpath=${eddy_out_dir}/'eddy_corrected_data.eddy_rotated_bvecs_modi_nan'

if [ ! -d ${dtifit_dir} ]; then
    mkdir -p ${dtifit_dir}
fi

sed 's/nan/0.000000/g' ${eddy_corrected_bvecs_fpath} > ${eddy_corrected_bvecs_modi_nan_fpath}

dtifit -k ${eddy_corrected_data_fpath} -o ${dtifit_dir}/'dti' -m ${nodif_brain_mask_gz_fpath} -r ${eddy_corrected_bvecs_modi_nan_fpath} -b ${bvals_data_fapth} --save_tensor