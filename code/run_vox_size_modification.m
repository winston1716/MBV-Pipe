function run_vox_size_modification(T2_dir_path, T2_new_vox_size_iso, save_raw_res_files_flag)
    addpath('./my_matlab_scr');
    addpath('/n02dat01/users/wtjiang/Software/matlab/matlab2022/toolbox/spm12');
    
    T2_nii_info = dir(fullfile(T2_dir_path, '*.nii'));
    T2_fpaths = cell(0);
    T2_new_fpaths = cell(0);
    if ischar(T2_new_vox_size_iso)
        T2_new_vox_size_iso_1 = str2double(T2_new_vox_size_iso);
    end

    T2_new_vox_size = [T2_new_vox_size_iso_1, T2_new_vox_size_iso_1, T2_new_vox_size_iso_1];
    for i = 1:1:numel(T2_nii_info)
        if ~T2_nii_info(i).isdir
            T2_fpaths{i} = fullfile(T2_dir_path, T2_nii_info(i).name);
            [~, T2_rotated_basename, ~] = fileparts(T2_fpaths{i});
            T2_new_fpaths{i} = fullfile(T2_dir_path, ...
                strcat(T2_rotated_basename, '_', T2_new_vox_size_iso, 'mm.nii'));
            wtjiang_vox_size_modification(T2_fpaths{i}, T2_new_fpaths{i}, T2_new_vox_size);
        end
    end

    if save_raw_res_files_flag == '0'
        for i = 1:1:numel(T2_nii_info)
            if ~T2_nii_info(i).isdir
                T2_fpaths{i} = fullfile(T2_dir_path, T2_nii_info(i).name);
                delete(T2_fpaths{i});
            end
        end
    end
end



