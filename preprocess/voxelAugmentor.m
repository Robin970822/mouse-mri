function voxelAugmentor(nii,AugmentTimes)
for i=1:length(nii)
    OM = spm_get_space(nii{i});
    NM=OM*AugmentTimes;
    NM(4,4)=1;
    spm_get_space(nii{i},NM);
    if exist([nii{i}(1:end-4),'.mat'])==2
        delete([nii{i}(1:end-4),'.mat']);
    end
end