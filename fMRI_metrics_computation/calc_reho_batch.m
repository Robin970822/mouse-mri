data_root = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse';
subj_names = dir([data_root, filesep, 'sub*']);
for i = 1:length(subj_names)
    %预处理后的数据（预处理至normalize）
    nii_file = [data_root, filesep, subj_name, filesep, 'rest', filesep, 'wrarest.nii'];
    %头动文件
    rp_file = [data_root, filesep, subj_name, filesep, 'rest', filesep, 'rp_arest.txt'];
    %重复时间
    TR = 2;
    %频段范围
    band = [0.01 0.08];
    %大脑mask
     brain_mask = 'E:\FDU\ISTBI\fMRI\fd_template_mouse\Reslice_3mm_TMBTA_Brain_Mask.nii';
    %计算结果保存路径
    save_dir2 = [data_root, filesep, subj_name, filesep, 'reho'];
    %平滑核大小
    sm_kernel = [6 6 6];
    %开始计算Reho指标
    RatfMRI_reho(nii_file,brain_mask,TR,band,rp_file,save_dir2,sm_kernel);
end