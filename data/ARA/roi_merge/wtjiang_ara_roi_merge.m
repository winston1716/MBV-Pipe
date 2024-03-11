clear;
clc;
close all;

ara_100um_dir = './100um';
ara_tmpl_fpath = fullfile(ara_100um_dir, 'tmpl_100um.nii');
ara_annt_fpath = fullfile(ara_100um_dir, 'annt_100um.nii');

ara_tmpl_hdr = spm_vol(ara_tmpl_fpath);
ara_annt_hdr = spm_vol(ara_annt_fpath);

ara_tmpl_data = spm_read_vols(ara_tmpl_hdr);
ara_annt_data = spm_read_vols(ara_annt_hdr);

labels = unique(ara_annt_data);