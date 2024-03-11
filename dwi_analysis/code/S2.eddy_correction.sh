#! /bin/bash

source dwi-pipe.cfg

dwi_data_dir=$1
index_fpath=${dwi_data_dir}/'index.txt'
acqp_fpath=${dwi_data_dir}/'acqparams.txt'
eddy_out_dir=${dwi_data_dir}/'eddy_out'
dwi_data_fapth=${dwi_data_dir}/'data.nii'
bvals_data_fapth=${dwi_data_dir}/'bvals'
bvecs_data_fapth=${dwi_data_dir}/'bvecs'
nodif_brain_mask_gz_fpath=${dwi_data_dir}/'nodif_brain_mask.nii.gz'

if [ ! -d ${eddy_out_dir} ]; then
    mkdir -p ${eddy_out_dir}
fi

bvals_num=0
bvals_data=$(cat ${bvals_data_fapth})
for bval_i in ${bvals_data[@]}; do
    ((bvals_num++))
done

indx=""
for ((i=1; i<=((${bvals_num})); i+=1)); do
    indx="${indx} 1"
done
echo ${indx} > ${index_fpath}

acqp='0 1 0 0.05'
echo ${acqp} > ${acqp_fpath}

# about 7 min
eddy_openmp --imain=${dwi_data_fapth} --mask=${nodif_brain_mask_gz_fpath} --acqp=${acqp_fpath} --index=${index_fpath} --bvals=${bvals_data_fapth} --bvecs=${bvecs_data_fapth} --out=${eddy_out_dir}/eddy_corrected_data