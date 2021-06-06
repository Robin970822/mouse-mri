%预处理后的数据(预处理至smooth）
nii_file = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse\sub0109\rest\swrarest.nii';
%头动文件
rp_file = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse\sub0109\rest\rp_arest.txt';
%重复时间
TR = 2;
%频段范围
band = [0.01 0.08];
%大脑mask
brain_mask = 'E:\FDU\ISTBI\fMRI\fd_template_mouse\Reslice_3mm_TMBTA_Brain_Mask.nii';
%计算结果存储的路径
save_dir1 = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse\sub0109\rest';
%开始计算alff和falff
RatfMRI_alff_falff(nii_file,brain_mask,TR,band,rp_file,save_dir1);