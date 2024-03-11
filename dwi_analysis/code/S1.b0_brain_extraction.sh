#! /bin/bash

source dwi-pipe.cfg

dwi_data_dir=$1
dwi_data_fapth=${dwi_data_dir}/'data.nii'
bvals_data_fapth=${dwi_data_dir}/'bvals'
nodif_data_all_fpath=${dwi_data_dir}/'nodif_data_all.nii.gz'
nodif_data_fpath=${dwi_data_dir}/'nodif_data.nii.gz'
nodif_data_n4_gz_fpath=${dwi_data_dir}/'nodif_data_n4.nii.gz'
nodif_data_n4_fpath=${dwi_data_dir}/'nodif_data_n4.nii'
nodif_brain_mask_fpath=${dwi_data_dir}/'nodif_brain_mask.nii'
nodif_brain_mask_gz_fpath=${dwi_data_dir}/'nodif_brain_mask.nii.gz'

b0_num=0 # b0 nums
bd_num=0 # b diffusion nums
bvals_data=$(cat ${bvals_data_fapth})
for bval_i in ${bvals_data[@]}; do
    ((bd_num++))
    if (( $(echo "${bval_i} < ${b0_upper}" | bc -l) )); then
        ((b0_num++))
        ((bd_num--))
    fi
done

fslroi ${dwi_data_fapth} ${nodif_data_all_fpath} 0 -1 0 -1 0 -1 0 ${b0_num}
mrmath ${nodif_data_all_fpath} mean ${nodif_data_fpath} -axis 3 -force
rm -rf ${nodif_data_all_fpath}

# preprocessing: n4
N4BiasFieldCorrection -d ${n_dim} -s ${shrink_factor} -b ${bspline_order} -i ${nodif_data_fpath} -o ${nodif_data_n4_gz_fpath}
if [ -f ${nodif_data_n4_gz_fpath} ]; then
    gunzip -f ${nodif_data_n4_gz_fpath}
fi

matlab -nodisplay -r "run_PCNN3D('${nodif_data_n4_fpath}'); exit;"
rm -rf ${nodif_data_n4_fpath}
if [ -f ${nodif_brain_mask_fpath} ]; then
    gzip -f ${nodif_brain_mask_fpath}
fi