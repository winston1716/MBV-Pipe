function wtjiang_roi_stats(T2_reg_2_dir, roi_acronym_fpath, T2_results_dir)
    roi_info_data = readtable(roi_acronym_fpath);
    roi_info_data = table2cell(roi_info_data);
    t_states = {'invivo', 'perfused', 'fixed'};
    
    % invivo
    invivo_annt_fpath = fullfile(T2_reg_2_dir, ['T2_', t_states{1}, '_annt.nii']);
    invivo_annt_hdr = spm_vol(invivo_annt_fpath);
    invivo_annt_data = spm_read_vols(invivo_annt_hdr);
    vox_size = prod(diag(invivo_annt_hdr.mat(1:3, 1:3)));
    
    invivo_roi_results_fname = ['T2_', t_states{1}, '_roi_stats.mat'];
    invivo_roi_results_fpath = fullfile(T2_results_dir, invivo_roi_results_fname);
    invivo_roi_results_data = struct();
    for i= 1:1:numel(roi_info_data)
        count_roi_i = sum(invivo_annt_data(:) == i);
        key_i = roi_info_data{i};
        invivo_roi_results_data.(key_i) = count_roi_i .* vox_size;
    end
    save(invivo_roi_results_fpath, 'invivo_roi_results_data');

    % perfused
    perfused_annt_fpath = fullfile(T2_reg_2_dir, ['T2_', t_states{2}, '_annt.nii']);
    perfused_annt_hdr = spm_vol(perfused_annt_fpath);
    perfused_annt_data = spm_read_vols(perfused_annt_hdr);
    vox_size = prod(diag(perfused_annt_hdr.mat(1:3, 1:3)));
    
    perfused_roi_results_fname = ['T2_', t_states{2}, '_roi_stats.mat'];
    perfused_roi_results_fpath = fullfile(T2_results_dir, perfused_roi_results_fname);
    perfused_roi_results_data = struct();
    for i= 1:1:numel(roi_info_data)
        count_roi_i = sum(perfused_annt_data(:) == i);
        key_i = roi_info_data{i};
        perfused_roi_results_data.(key_i) = count_roi_i .* vox_size;
    end
    save(perfused_roi_results_fpath, 'perfused_roi_results_data');

    % fixed
    fixed_annt_fpath = fullfile(T2_reg_2_dir, ['T2_', t_states{3}, '_annt.nii']);
    fixed_annt_hdr = spm_vol(fixed_annt_fpath);
    fixed_annt_data = spm_read_vols(fixed_annt_hdr);
    vox_size = prod(diag(fixed_annt_hdr.mat(1:3, 1:3)));
    
    fixed_roi_results_fname = ['T2_', t_states{3}, '_roi_stats.mat'];
    fixed_roi_results_fpath = fullfile(T2_results_dir, fixed_roi_results_fname);
    fixed_roi_results_data = struct();
    for i= 1:1:numel(roi_info_data)
        count_roi_i = sum(fixed_annt_data(:) == i);
        key_i = roi_info_data{i};
        fixed_roi_results_data.(key_i) = count_roi_i .* vox_size;
    end
    save(fixed_roi_results_fpath, 'fixed_roi_results_data');

end