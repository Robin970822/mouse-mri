%%
clear; clc;
data_root = 'E:\FDU\ISTBI\fMRI\pm2.5-offspring-mouse';
filenames = dir([data_root, filesep, 'sub07*']);

temp_folder = 'E:\FDU\ISTBI\fMRI\temp';
save([temp_folder, filesep, 'data_root.mat'], 'data_root');
%%
for i=1:length(filenames)
    subj_name = filenames(i).name;
    save([temp_folder, filesep, 'subj_name.mat'], 'subj_name');
    
    % List of open inputs
    nrun = 1; % enter the number of runs here
    jobfile = {'E:\FDU\ISTBI\fMRI\Rest3456_VBM123_coregister_segment_normalise_smooth_batch_job.m'};
    jobs = repmat(jobfile, 1, nrun);
    inputs = cell(0, nrun);
    for crun = 1:nrun
    end
    spm('defaults', 'FMRI');
    spm_jobman('run', jobs, inputs{:});
    disp([subj_name, ' Done.'])
end
