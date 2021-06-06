data_root = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse';
subj_names = dir([data_root, filesep, 'sub*']);
for i = 1:length(subj_names)
    subj_name = subj_names(i).name;
    %Ԥ����������(Ԥ������smooth��
    nii_file = [data_root, filesep, subj_name, filesep, 'rest', filesep, 'swrarest.nii'];
    %ͷ���ļ�
    rp_file = [data_root, filesep, subj_name, filesep, 'rest', filesep, 'rp_arest.txt'];
    %�ظ�ʱ��
    TR = 2;
    %Ƶ�η�Χ
    band = [0.01 0.08];
    %����mask
    brain_mask = 'E:\FDU\ISTBI\fMRI\fd_template_mouse\Reslice_3mm_TMBTA_Brain_Mask.nii';
    %�������洢��·��
    save_dir1 = [data_root, filesep, subj_name, filesep, 'rest'];
    %��ʼ����alff��falff
    RatfMRI_alff_falff(nii_file,brain_mask,TR,band,rp_file,save_dir1);
    disp([subj_name, 'Done.'])
end