function run_smooth(data_fpath, smooth_size)
    addpath('./my_matlab_scr');
    addpath('/n02dat01/users/wtjiang/Software/matlab/matlab2022/toolbox/spm12');
    if ischar(smooth_size)
        smooth_size = str2double(smooth_size);
    end
    mwc_fnames = dir(data_fpath);
    mwc_fnames = mwc_fnames(startsWith({mwc_fnames.name}, 'mwc'));
    mwc_matrix = cell(0);
    for i=1:1:numel(mwc_fnames)
        mwc_fname_i = mwc_fnames(i).name;
        mwc_str_i = [fullfile(data_fpath, mwc_fname_i), ',1'];
        mwc_matrix(i, 1) = {mwc_str_i};
    end

    % run smooth
    spm('defaults', 'FMRI');
    matlabbatch = wtjiang_smooth_job(mwc_matrix, smooth_size);
    spm_jobman('run', matlabbatch);
end