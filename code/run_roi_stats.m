function run_roi_stats(T2_reg_2_dir, roi_acronym_fpath, T2_resluts_dir)
    addpath('./my_matlab_scr');
    addpath('/n02dat01/users/wtjiang/Software/matlab/matlab2022/toolbox/spm12');
    wtjiang_roi_stats(T2_reg_2_dir, roi_acronym_fpath, T2_resluts_dir);
end
