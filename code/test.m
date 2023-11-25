clear;
clc;
T2_dir_path = '/n02dat01/users/wtjiang/Workspace/MBV-Pipe/data/sub-003/T2_brain/brain_2mm';
T2_new_vox_size_iso = '2';
save_raw_res_files_flag = '0';

run_vox_size_modification(T2_dir_path, T2_new_vox_size_iso, save_raw_res_files_flag);
disp('OK');