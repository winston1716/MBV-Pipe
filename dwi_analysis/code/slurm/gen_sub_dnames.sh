#! /bin/bash

sub_dnames_list_fpath='./sub_dnames_list.txt'
data_dir='/n02dat01/users/wtjiang/Workspace/MBV-Pipe/dwi_analysis/data'
sub_dnames=($(ls -d ${data_dir}/sub-*))

if [ ! -f ${sub_dnames_list_fpath} ]; then
    touch ${sub_dnames_list_fpath}
else
    echo -n > ${sub_dnames_list_fpath}
fi

for sub_i in ${sub_dnames[@]}; do
    echo "${sub_i}" >> ${sub_dnames_list_fpath}
done
