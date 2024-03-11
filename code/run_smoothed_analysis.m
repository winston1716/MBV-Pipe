function run_smoothed_analysis(data_fpath, scale_factor)
    addpath('./my_matlab_scr');
    addpath('/n02dat01/users/wtjiang/Software/matlab/matlab2022/toolbox/spm12');
    if ischar(scale_factor)
        scale_factor = str2double(scale_factor);
    end    
    T2_file_list = spm_select('FPList', data_fpath, '^T2.*\.nii$');
    for i = 1:1:size(T2_file_list, 1)
        T2_file_i = T2_file_list(i, :);
        [data_dir, bname, ext] = fileparts(T2_file_i);
        fprintf(bname);
        fprintf('\n');
        % volume statistics
        smwc1_fpath = spm_select('FPList', data_dir, ['^smwc1', bname, '\.nii$']);  % GM
        smwc2_fpath = spm_select('FPList', data_dir, ['^smwc2', bname, '\.nii$']);  % WM
        smwc3_fpath = spm_select('FPList', data_dir, ['^smwc3', bname, '\.nii$']);  % CSF
    
        smwc1_hdr = spm_vol(smwc1_fpath);
        smwc2_hdr = spm_vol(smwc2_fpath);
        smwc3_hdr = spm_vol(smwc3_fpath);
    
        smwc1_data = spm_read_vols(smwc1_hdr);
        smwc2_data = spm_read_vols(smwc2_hdr);
        smwc3_data = spm_read_vols(smwc3_hdr);
    
        %% Calculate the tissue volumes separately
        smwc1_data_total_sum = sum(smwc1_data(:), 'omitnan');
        smwc2_data_total_sum = sum(smwc2_data(:), 'omitnan');
        smwc3_data_total_sum = sum(smwc3_data(:), 'omitnan');
    
        vox_size = prod(diag(smwc1_hdr.mat(1:3, 1:3)));
        corrected_smwc1_data = smwc1_data_total_sum .* vox_size ./ scale_factor;
        corrected_smwc2_data = smwc2_data_total_sum .* vox_size ./ scale_factor;
        corrected_smwc3_data = smwc3_data_total_sum .* vox_size ./ scale_factor;
    
        total_brain_volume_data = corrected_smwc1_data + corrected_smwc2_data;
        total_intracranial_volume_data = corrected_smwc1_data + ...
            corrected_smwc2_data+ corrected_smwc3_data;
    
        %% Output the corrected volume
        p=strfind(bname,'_reg2tpm');
        results_fname = [bname(1:p-1), '_smoothed_volume_stats.mat'];
        results_fpath = fullfile(data_dir, results_fname);
        smoothed_volume_stats_results.GM = corrected_smwc1_data;
        smoothed_volume_stats_results.WM = corrected_smwc2_data;
        smoothed_volume_stats_results.CSF = corrected_smwc3_data;
        smoothed_volume_stats_results.TBV = total_brain_volume_data;
        smoothed_volume_stats_results.TIV = total_intracranial_volume_data;
    
        save(results_fpath,'smoothed_volume_stats_results');
    end
end
