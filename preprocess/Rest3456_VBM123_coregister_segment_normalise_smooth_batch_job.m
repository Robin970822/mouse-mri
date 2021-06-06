%-----------------------------------------------------------------------
% Job saved on 18-May-2021 23:33:12 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%% load temp variables
temp_folder = 'E:\FDU\ISTBI\fMRI\temp';
load([temp_folder, filesep, 'data_root.mat']);
load([temp_folder, filesep, 'subj_name.mat']);

data_ref = [data_root, filesep, subj_name, filesep, 'T2', filesep, 'T2.nii,1'];
data_source = [data_root, filesep, subj_name, filesep, 'rest', filesep, 'meanarest.nii,1'];
n_timepoints = 240;
for j=1:n_timepoints
    data_cell{j, 1} = [data_root, filesep, subj_name, filesep, 'rest', filesep, 'rarest.nii,', num2str(j)];
end
%-----------------------------------------------------------------------
matlabbatch{1}.spm.spatial.coreg.estimate.ref = {data_ref};
matlabbatch{1}.spm.spatial.coreg.estimate.source = {data_source};
%%
matlabbatch{1}.spm.spatial.coreg.estimate.other = data_cell;
%%
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
matlabbatch{2}.spm.tools.oldseg.data = {data_ref};
matlabbatch{2}.spm.tools.oldseg.output.GM = [0 0 0];
matlabbatch{2}.spm.tools.oldseg.output.WM = [0 0 0];
matlabbatch{2}.spm.tools.oldseg.output.CSF = [0 0 0];
matlabbatch{2}.spm.tools.oldseg.output.biascor = 1;
matlabbatch{2}.spm.tools.oldseg.output.cleanup = 0;
matlabbatch{2}.spm.tools.oldseg.opts.tpm = {
                                            'E:\FDU\ISTBI\fMRI\fd_template_mouse\TMBTA_Grey.nii,1'
                                            'E:\FDU\ISTBI\fMRI\fd_template_mouse\TMBTA_White.nii,1'
                                            'E:\FDU\ISTBI\fMRI\fd_template_mouse\TMBTA_CSF.nii,1'
                                            };
matlabbatch{2}.spm.tools.oldseg.opts.ngaus = [2
                                              2
                                              2
                                              4];
matlabbatch{2}.spm.tools.oldseg.opts.regtype = 'subj';
matlabbatch{2}.spm.tools.oldseg.opts.warpreg = 1;
matlabbatch{2}.spm.tools.oldseg.opts.warpco = 25;
matlabbatch{2}.spm.tools.oldseg.opts.biasreg = 0.0001;
matlabbatch{2}.spm.tools.oldseg.opts.biasfwhm = 60;
matlabbatch{2}.spm.tools.oldseg.opts.samp = 3;
matlabbatch{2}.spm.tools.oldseg.opts.msk = {''};
matlabbatch{3}.spm.tools.oldseg.data(1) = cfg_dep('Old Segment: Bias Corr Images', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','biascorr', '()',{':'}));
matlabbatch{3}.spm.tools.oldseg.output.GM = [1 1 1];
matlabbatch{3}.spm.tools.oldseg.output.WM = [1 1 1];
matlabbatch{3}.spm.tools.oldseg.output.CSF = [0 0 0];
matlabbatch{3}.spm.tools.oldseg.output.biascor = 1;
matlabbatch{3}.spm.tools.oldseg.output.cleanup = 0;
matlabbatch{3}.spm.tools.oldseg.opts.tpm = {
                                            'E:\FDU\ISTBI\fMRI\fd_template_mouse\TMBTA_Grey.nii,1'
                                            'E:\FDU\ISTBI\fMRI\fd_template_mouse\TMBTA_White.nii,1'
                                            'E:\FDU\ISTBI\fMRI\fd_template_mouse\TMBTA_CSF.nii,1'
                                            };
matlabbatch{3}.spm.tools.oldseg.opts.ngaus = [2
                                              2
                                              2
                                              4];
matlabbatch{3}.spm.tools.oldseg.opts.regtype = 'subj';
matlabbatch{3}.spm.tools.oldseg.opts.warpreg = 1;
matlabbatch{3}.spm.tools.oldseg.opts.warpco = 25;
matlabbatch{3}.spm.tools.oldseg.opts.biasreg = 0.0001;
matlabbatch{3}.spm.tools.oldseg.opts.biasfwhm = 60;
matlabbatch{3}.spm.tools.oldseg.opts.samp = 3;
matlabbatch{3}.spm.tools.oldseg.opts.msk = {''};
matlabbatch{4}.spm.tools.oldnorm.write.subj.matname(1) = cfg_dep('Old Segment: Norm Params Subj->MNI', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','snfile', '()',{':'}));
matlabbatch{4}.spm.tools.oldnorm.write.subj.resample(1) = cfg_dep('Coregister: Estimate: Coregistered Images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
matlabbatch{4}.spm.tools.oldnorm.write.roptions.preserve = 0;
matlabbatch{4}.spm.tools.oldnorm.write.roptions.bb = [-93 -141 -69
                                                      93 141 69];
matlabbatch{4}.spm.tools.oldnorm.write.roptions.vox = [3 3 3];
matlabbatch{4}.spm.tools.oldnorm.write.roptions.interp = 1;
matlabbatch{4}.spm.tools.oldnorm.write.roptions.wrap = [0 0 0];
matlabbatch{4}.spm.tools.oldnorm.write.roptions.prefix = 'w';
matlabbatch{5}.spm.spatial.smooth.data(1) = cfg_dep('Old Normalise: Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{5}.spm.spatial.smooth.fwhm = [6 6 6];
matlabbatch{5}.spm.spatial.smooth.dtype = 0;
matlabbatch{5}.spm.spatial.smooth.im = 0;
matlabbatch{5}.spm.spatial.smooth.prefix = 's';
matlabbatch{6}.spm.spatial.smooth.data(1) = cfg_dep('Old Segment: mwc1 Images', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','mwc1', '()',{':'}));
matlabbatch{6}.spm.spatial.smooth.data(2) = cfg_dep('Old Segment: mwc2 Images', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','mwc2', '()',{':'}));
matlabbatch{6}.spm.spatial.smooth.fwhm = [0.3 0.3 0.3];
matlabbatch{6}.spm.spatial.smooth.dtype = 0;
matlabbatch{6}.spm.spatial.smooth.im = 0;
matlabbatch{6}.spm.spatial.smooth.prefix = 's';
