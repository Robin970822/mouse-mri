clear all;clc
data_root = 'F:\datascc\data\';

for i=1
    func_name = [data_root 'sub' num2str(i) '\rest\rest.nii'];
    t2_name = [data_root 'sub' num2str(i) '\T2\T2.nii'];
    func_nii_files{i} = func_name;
    t2_nii_files{i} = t2_name;
    disp(func_name);
    disp(t2_name);
end

voxelAugmentor(func_nii_files,10);%直接把功能放大10倍
voxelAugmentor(t2_nii_files,10);%直接把结构放大10倍

%%
clear all; clc;
template_nii_dirs = dir(['fd_p56', filesep, '*.nii.gz']);

for i=1:length(template_nii_dirs)
    template_name = ['fd_p56', filesep, template_nii_dirs(1).name];
    template_nii_files{i} = template_name;
end
