function run_dartel(data_dir, dartel_tpm_dir)
    addpath('./my_matlab_scr');
    addpath('/n02dat01/users/wtjiang/Software/matlab/matlab2022/toolbox/spm12');

    %% create c_matrix
    subs_folder = dir(data_dir);
    subs_folder = subs_folder([subs_folder.isdir] & startsWith({subs_folder.name}, 'sub'));
    c1_matrix = cell(0);
    c2_matrix = cell(0);
    c3_matrix = cell(0);
    template_saved_fpath = fullfile(data_dir, subs_folder(1).name, 'T2_vbm');

    for i=1:1:numel(subs_folder)
        sub_i_T2_vbm_dir = fullfile(data_dir, subs_folder(i).name, 'T2_vbm');
        sub_i_T2_vbm_folder = dir(sub_i_T2_vbm_dir);

        % c1
        sub_i_T2_vbm_c1_invivo_fname = sub_i_T2_vbm_folder(startsWith({sub_i_T2_vbm_folder.name}, 'c1T2_invivo'));
        sub_i_T2_vbm_c1_invivo_fname = sub_i_T2_vbm_c1_invivo_fname.name;
        sub_i_T2_vbm_c1_invivo_str = [fullfile(sub_i_T2_vbm_dir, sub_i_T2_vbm_c1_invivo_fname), ',1'];

        sub_i_T2_vbm_c1_perfused_fname = sub_i_T2_vbm_folder(startsWith({sub_i_T2_vbm_folder.name}, 'c1T2_perfused'));
        sub_i_T2_vbm_c1_perfused_fname = sub_i_T2_vbm_c1_perfused_fname.name;
        sub_i_T2_vbm_c1_perfused_str = [fullfile(sub_i_T2_vbm_dir, sub_i_T2_vbm_c1_perfused_fname), ',1'];

        sub_i_T2_vbm_c1_fixed_fname = sub_i_T2_vbm_folder(startsWith({sub_i_T2_vbm_folder.name}, 'c1T2_fixed'));
        sub_i_T2_vbm_c1_fixed_fname = sub_i_T2_vbm_c1_fixed_fname.name;
        sub_i_T2_vbm_c1_fixed_str = [fullfile(sub_i_T2_vbm_dir, sub_i_T2_vbm_c1_fixed_fname), ',1'];

        str_i_T2_vbm_c1_strs = {sub_i_T2_vbm_c1_invivo_str, sub_i_T2_vbm_c1_perfused_str, sub_i_T2_vbm_c1_fixed_str};
        c1_matrix(end + 1:end + numel(str_i_T2_vbm_c1_strs)) = str_i_T2_vbm_c1_strs;

        % c2
        sub_i_T2_vbm_c2_invivo_fname = sub_i_T2_vbm_folder(startsWith({sub_i_T2_vbm_folder.name}, 'c2T2_invivo'));
        sub_i_T2_vbm_c2_invivo_fname = sub_i_T2_vbm_c2_invivo_fname.name;
        sub_i_T2_vbm_c2_invivo_str = [fullfile(sub_i_T2_vbm_dir, sub_i_T2_vbm_c2_invivo_fname), ',1'];

        sub_i_T2_vbm_c2_perfused_fname = sub_i_T2_vbm_folder(startsWith({sub_i_T2_vbm_folder.name}, 'c2T2_perfused'));
        sub_i_T2_vbm_c2_perfused_fname = sub_i_T2_vbm_c2_perfused_fname.name;
        sub_i_T2_vbm_c2_perfused_str = [fullfile(sub_i_T2_vbm_dir, sub_i_T2_vbm_c2_perfused_fname), ',1'];

        sub_i_T2_vbm_c2_fixed_fname = sub_i_T2_vbm_folder(startsWith({sub_i_T2_vbm_folder.name}, 'c2T2_fixed'));
        sub_i_T2_vbm_c2_fixed_fname = sub_i_T2_vbm_c2_fixed_fname.name;
        sub_i_T2_vbm_c2_fixed_str = [fullfile(sub_i_T2_vbm_dir, sub_i_T2_vbm_c2_fixed_fname), ',1'];

        str_i_T2_vbm_c2_strs = {sub_i_T2_vbm_c2_invivo_str, sub_i_T2_vbm_c2_perfused_str, sub_i_T2_vbm_c2_fixed_str};
        c2_matrix(end + 1:end + numel(str_i_T2_vbm_c2_strs)) = str_i_T2_vbm_c2_strs;

        % c3
        sub_i_T2_vbm_c3_invivo_fname = sub_i_T2_vbm_folder(startsWith({sub_i_T2_vbm_folder.name}, 'c3T2_invivo'));
        sub_i_T2_vbm_c3_invivo_fname = sub_i_T2_vbm_c3_invivo_fname.name;
        sub_i_T2_vbm_c3_invivo_str = [fullfile(sub_i_T2_vbm_dir, sub_i_T2_vbm_c3_invivo_fname), ',1'];

        sub_i_T2_vbm_c3_perfused_fname = sub_i_T2_vbm_folder(startsWith({sub_i_T2_vbm_folder.name}, 'c3T2_perfused'));
        sub_i_T2_vbm_c3_perfused_fname = sub_i_T2_vbm_c3_perfused_fname.name;
        sub_i_T2_vbm_c3_perfused_str = [fullfile(sub_i_T2_vbm_dir, sub_i_T2_vbm_c3_perfused_fname), ',1'];

        sub_i_T2_vbm_c3_fixed_fname = sub_i_T2_vbm_folder(startsWith({sub_i_T2_vbm_folder.name}, 'c3T2_fixed'));
        sub_i_T2_vbm_c3_fixed_fname = sub_i_T2_vbm_c3_fixed_fname.name;
        sub_i_T2_vbm_c3_fixed_str = [fullfile(sub_i_T2_vbm_dir, sub_i_T2_vbm_c3_fixed_fname), ',1'];

        str_i_T2_vbm_c3_strs = {sub_i_T2_vbm_c3_invivo_str, sub_i_T2_vbm_c3_perfused_str, sub_i_T2_vbm_c3_fixed_str};
        c3_matrix(end + 1:end + numel(str_i_T2_vbm_c3_strs)) = str_i_T2_vbm_c3_strs;
    end
    c1_matrix = c1_matrix';
    c2_matrix = c2_matrix';
    c3_matrix = c3_matrix';
    c_matrix = {c1_matrix, c2_matrix, c3_matrix};

    %% run dartel
    spm('defaults', 'FMRI');
    matlabbatch = wtjiang_dartel_job(c_matrix);
    spm_jobman('run', matlabbatch);

    dartel_output_files = fullfile(template_saved_fpath, 'Template*');

    movefile(dartel_output_files, dartel_tpm_dir);
end