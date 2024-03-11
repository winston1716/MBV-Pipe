function matlabbatch = wtjiang_old_segment_job(data_fpath, TPM_dir)
    TPM_GM=fullfile(TPM_dir, 'TPM_GM_1.5mm.nii');
    TPM_WM=fullfile(TPM_dir, 'TPM_WM_1.5mm.nii');
    TPM_CSF=fullfile(TPM_dir, 'TPM_CSF_1.5mm.nii');
    matlabbatch{1}.spm.tools.oldseg.data = {[data_fpath, ',1']};
    matlabbatch{1}.spm.tools.oldseg.output.GM = [1 1 1];
    matlabbatch{1}.spm.tools.oldseg.output.WM = [1 1 1];
    matlabbatch{1}.spm.tools.oldseg.output.CSF = [1 1 1];
    matlabbatch{1}.spm.tools.oldseg.output.biascor = 1;
    matlabbatch{1}.spm.tools.oldseg.output.cleanup = 0;
    matlabbatch{1}.spm.tools.oldseg.opts.tpm = {[TPM_GM, ',1'] 
                                                [TPM_WM, ',1'] 
                                                [TPM_CSF, ',1']};
    matlabbatch{1}.spm.tools.oldseg.opts.ngaus = [2
                                                  2
                                                  2
                                                  4];
    matlabbatch{1}.spm.tools.oldseg.opts.regtype = 'none';
    matlabbatch{1}.spm.tools.oldseg.opts.warpreg = 1;
    matlabbatch{1}.spm.tools.oldseg.opts.warpco = 25;
    matlabbatch{1}.spm.tools.oldseg.opts.biasreg = 0.0001;
    matlabbatch{1}.spm.tools.oldseg.opts.biasfwhm = 50; % default 30
    matlabbatch{1}.spm.tools.oldseg.opts.samp = 3;
    matlabbatch{1}.spm.tools.oldseg.opts.msk = {''};
    
end

