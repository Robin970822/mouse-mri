%-----------------------------------------------------------------------
% Job saved on 14-May-2021 17:09:31 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
%% load temp variables
temp_folder = 'E:\FDU\ISTBI\fMRI\temp';
load([temp_folder, filesep, 'data_root.mat']);
load([temp_folder, filesep, 'subj_name.mat']);

n_timepoints = 240;
for j=1:n_timepoints
    data_cell{j, 1} = [data_root, filesep, subj_name, filesep, 'rest_BET', filesep, 'rest_BET.nii,', num2str(j)];
end

%%
matlabbatch{1}.spm.temporal.st.scans = { data_cell }';
%%
matlabbatch{1}.spm.temporal.st.nslices = 36;
matlabbatch{1}.spm.temporal.st.tr = 2;
matlabbatch{1}.spm.temporal.st.ta = 1.94444444444444;
matlabbatch{1}.spm.temporal.st.so = [1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36];
matlabbatch{1}.spm.temporal.st.refslice = 1;
matlabbatch{1}.spm.temporal.st.prefix = 'a';
matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.interp = 3;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
