%Ԥ���������ݣ�Ԥ������normalize��
nii_file = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse\sub0109\rest\wrarest.nii';
%ͷ���ļ�
rp_file = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse\sub0109\rest\rp_arest.txt';
%�ظ�ʱ��
TR = 2;
%Ƶ�η�Χ
band = [0.01 0.08];
%����mask
brain_mask = 'E:\FDU\ISTBI\fMRI\fd_template_mouse\Reslice_3mm_TMBTA_Brain_Mask.nii';
%����������·��
save_dir2 = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse\sub0109\rest';
%ƽ���˴�С
sm_kernel = [6 6 6];
%��ʼ����Rehoָ��
RatfMRI_reho(nii_file,brain_mask,TR,band,rp_file,save_dir2,sm_kernel);