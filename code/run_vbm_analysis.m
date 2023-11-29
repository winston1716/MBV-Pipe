function run_vbm_analysis(data_fpath, TPM_fpath, scale_factor)
    addpath('./my_matlab_scr');
    addpath('/n02dat01/users/wtjiang/Software/matlab/matlab2022/toolbox/spm12');
    if ischar(scale_factor)
        scale_factor = str2double(scale_factor);
    end
    [data_dir, bname, ext] = fileparts(data_fpath);

    % run old segment
    spm('defaults', 'FMRI');
    matlabbatch = wtjiang_old_segment_job(data_fpath, TPM_fpath);
    spm_jobman('run', matlabbatch);

    % volume statistics
    mwc1_fpath = spm_select('FPList', data_dir, ['^mwc1', bname, '\.nii$']);  % GM
    mwc2_fpath = spm_select('FPList', data_dir, ['^mwc2', bname, '\.nii$']);  % WM
    mwc3_fpath = spm_select('FPList', data_dir, ['^mwc3', bname, '\.nii$']);  % CSF

    mwc1_hdr = spm_vol(mwc1_fpath);
    mwc2_hdr = spm_vol(mwc2_fpath);
    mwc3_hdr = spm_vol(mwc3_fpath);
    
    mwc1_data = spm_read_vols(mwc1_hdr);
    mwc2_data = spm_read_vols(mwc2_hdr);
    mwc3_data = spm_read_vols(mwc3_hdr);

    %% Calculate the tissue volumes separately
    mwc1_data_total_sum = sum(mwc1_data(:), 'omitnan');
    mwc2_data_total_sum = sum(mwc2_data(:), 'omitnan');
    mwc3_data_total_sum = sum(mwc3_data(:), 'omitnan');

    vox_size = prod(diag(mwc1_hdr.mat(1:3, 1:3)));
    corrected_mwc1_data = mwc1_data_total_sum .* vox_size ./ scale_factor;
    corrected_mwc2_data = mwc2_data_total_sum .* vox_size ./ scale_factor;
    corrected_mwc3_data = mwc3_data_total_sum .* vox_size ./ scale_factor;
    
    total_brain_volume_data = corrected_mwc1_data + corrected_mwc2_data;
    total_intracranial_volume_data = corrected_mwc1_data + ...
        corrected_mwc2_data+ corrected_mwc3_data;
    
    %% Output the corrected volume
    p=strfind(bname,'_reg2tpm');
    results_fname = [bname(1:p-1), '_volume_stats.mat'];
    results_fpath = fullfile(data_dir, results_fname);
    volume_stats_results.GM = corrected_mwc1_data;
    volume_stats_results.WM = corrected_mwc2_data;
    volume_stats_results.CSF = corrected_mwc3_data;
    volume_stats_results.TBV = total_brain_volume_data;
    volume_stats_results.TIV = total_intracranial_volume_data;
    
    save(results_fpath,'volume_stats_results');
end
