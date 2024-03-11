%reg_mean_file = spm_select('FPList',[work_dir],[strcat('*.nii$')]); %选择当前目录的文件
rmean_map_hdr = spm_vol('F:\study\atlas\P56\P56_Annotation.nii');
rmean_map = spm_read_vols(rmean_map_hdr);

ROI_1 = rmean_map==449; %对图像矩阵进行的处理
mask_hdr1 = rmean_map_hdr;
mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\other','80_TR.nii'); %保存的文件名称
mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
spm_write_vol(mask_hdr1, ROI_1); %保存为nii格式

% ROI_2 = rmean_map==95; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\SSp-un','SSp-un_2.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_2); %保存为nii格式
% 
% ROI_3 = rmean_map==96; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\SSp-un','SSp-un_3.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_3); %保存为nii格式
% 
% ROI_4 = rmean_map==97; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\SSp-un','SSp-un_4.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_4); %保存为nii格式
% 
% ROI_5 = rmean_map==98; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\SSp-un','SSp-un_5.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_5); %保存为nii格式
% 
% ROI_6 = rmean_map==99; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\SSp-un','SSp-un_6.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_6); %保存为nii格式
% 
% ROI_7 = rmean_map==354; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\PTLp','VISrl_1.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_7); %保存为nii格式
% 
% ROI_8 = rmean_map==355; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\PTLp','VISrl_2.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_8); %保存为nii格式
% 
% ROI_9 = rmean_map==356; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\PTLp','VISrl_3.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_9); %保存为nii格式
% 
% ROI_10 = rmean_map==357; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\PTLp','VISrl_4.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_10); %保存为nii格式
% 
% ROI_11 = rmean_map==358; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\PTLp','VISrl_5.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_11); %保存为nii格式
% 
% ROI_12 = rmean_map==359; %对图像矩阵进行的处理
% mask_hdr1 = rmean_map_hdr;
% mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\PTLp','VISrl_6.nii'); %保存的文件名称
% mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
% spm_write_vol(mask_hdr1, ROI_12); %保存为nii格式

%% merge
% 左前丘脑与左后丘脑合并为左丘脑
ROI1 = spm_vol('F:\study\allen data\structure_mask\SSp-un\SSp-un_1.nii');
ROI2 = spm_vol('F:\study\allen data\structure_mask\SSp-un\SSp-un_2.nii');
ROI3 = spm_vol('F:\study\allen data\structure_mask\SSp-un\SSp-un_3.nii');
ROI4 = spm_vol('F:\study\allen data\structure_mask\SSp-un\SSp-un_4.nii');
ROI5 = spm_vol('F:\study\allen data\structure_mask\SSp-un\SSp-un_5.nii');
ROI6 = spm_vol('F:\study\allen data\structure_mask\SSp-un\SSp-un_6.nii');
% ROI7 = spm_vol('F:\study\allen data\structure_mask\PTLp\VISrl_1.nii');
% ROI8 = spm_vol('F:\study\allen data\structure_mask\PTLp\VISrl_2.nii');
% ROI9 = spm_vol('F:\study\allen data\structure_mask\PTLp\VISrl_3.nii');
% ROI10 = spm_vol('F:\study\allen data\structure_mask\PTLp\VISrl_4.nii');
% ROI11 = spm_vol('F:\study\allen data\structure_mask\PTLp\VISrl_5.nii');
% ROI12 = spm_vol('F:\study\allen data\structure_mask\PTLp\VISrl_6.nii');

a1 = spm_read_vols(ROI1); %得到NII图像矩阵
a2 = spm_read_vols(ROI2);
a3 = spm_read_vols(ROI3);
a4 = spm_read_vols(ROI4);
a5 = spm_read_vols(ROI5);
a6 = spm_read_vols(ROI6);
% a7 = spm_read_vols(ROI7); %得到NII图像矩阵
% a8 = spm_read_vols(ROI8);
% a9 = spm_read_vols(ROI9);
% a10 = spm_read_vols(ROI10);
% a11 = spm_read_vols(ROI11);
% a12 = spm_read_vols(ROI12);

roi = a1 + a2 + a3 + a4 + a5 + a6;
mask_hdr1.fname = fullfile('F:\study\allen data\structure_mask\SSp-un','75_SSp-un.nii'); %保存的文件名称
mask_hdr1.dt = [16 0]; % datatype: float32   %% spm datatype
spm_write_vol(mask_hdr1, roi); %保存为nii格式
