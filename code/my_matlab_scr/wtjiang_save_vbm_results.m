function wtjiang_save_vbm_results(T2_vbm_dir, saved_dir)
    split_dir_str = strsplit(T2_vbm_dir, '/');
    sub_id = split_dir_str(end-1);
    t_states = {'invivo', 'perfused', 'fixed'};
    invivo_results_fname = ['T2_', t_states{1}, '_volume_stats.mat'];
    invivo_results_fpath = fullfile(T2_vbm_dir, invivo_results_fname);
    invivo_results_mat = load(invivo_results_fpath);
    invivo_results_data = invivo_results_mat.volume_stats_resluts;
    
    perfused_results_fname = ['T2_', t_states{2}, '_volume_stats.mat'];
    perfused_results_fpath = fullfile(T2_vbm_dir, perfused_results_fname);
    perfused_results_mat = load(perfused_results_fpath);
    perfused_results_data = perfused_results_mat.volume_stats_resluts;
    
    fixed_results_fname = ['T2_', t_states{3}, '_volume_stats.mat'];
    fixed_results_fpath = fullfile(T2_vbm_dir, fixed_results_fname);
    fixed_results_mat = load(fixed_results_fpath);
    fixed_results_data = fixed_results_mat.volume_stats_resluts;
    
    GM_data = [invivo_results_data.GM, perfused_results_data.GM, fixed_results_data.GM];
    WM_data = [invivo_results_data.WM, perfused_results_data.WM, fixed_results_data.WM];
    CSF_data = [invivo_results_data.CSF, perfused_results_data.CSF, fixed_results_data.CSF];
    TBV_data = [invivo_results_data.TBV, perfused_results_data.TBV, fixed_results_data.TBV];
    TIV_data = [invivo_results_data.TIV, perfused_results_data.TIV, fixed_results_data.TIV];
    
    x = {'GM', 'WM', 'CSF', 'TBV', 'TIV'};
    order = {'GM', 'WM', 'CSF', 'TBV', 'TIV'};
    
    x_categ = categorical(x, order);
    figure(1);
    bar(x_categ, [GM_data; WM_data; CSF_data; TBV_data; TIV_data]);
    xlabel('Tissue Type');
    ylabel('Volume(mm^3)');
    ylim([0, 550]);
    title('Volume Statistics Results')
    legend('Invivo', 'Perfused', 'Fixed');
    
    fig = gcf;
    fig.Position = [100, 800, 1200, 800];
    saved_fig_fname = strcat(sub_id, '_results.png');
    saved_fig_fpath = fullfile(saved_dir, saved_fig_fname);
    saved_fig_fpath = saved_fig_fpath{1};
    saveas(gcf, saved_fig_fpath);
end