%Ԥ����������(Ԥ������smooth��
nii_file = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse\sub0109\rest\swrarest.nii';
%ͷ���ļ�
rp_file = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse\sub0109\rest\rp_arest.txt';
%�ظ�ʱ��
TR = 2;
%Ƶ�η�Χ
band = [0.01 0.08];
%����mask
brain_mask = 'E:\FDU\ISTBI\fMRI\fd_template_mouse\Reslice_3mm_TMBTA_Brain_Mask.nii';
%�������洢��·��
save_dir1 = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse\sub0109\rest';
%��ʼ����alff��falff
RatfMRI_alff_falff(nii_file,brain_mask,TR,band,rp_file,save_dir1);