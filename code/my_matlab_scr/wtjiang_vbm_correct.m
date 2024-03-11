function wtjiang_vbm_correct(input_dir, output_dir, mask_fpath)
    data_dir = input_dir;
    corrected_data_dir = output_dir;
    mask_hdr = spm_vol(mask_fpath);
    mask_data = spm_read_vols(mask_hdr);

    t_states = {'T2_invivo_reg2tpm.nii' 'T2_perfused_reg2tpm.nii' 'T2_fixed_reg2tpm.nii'};
    m_prefixs = {'mwc1', 'mwc2', 'mwc3'};
    for i=1:1:numel(t_states)
        for j=1:1:numel(m_prefixs)
            file_i_j_fpath = fullfile(data_dir, [m_prefixs{j}, t_states{i}]);
            file_i_j_hdr = spm_vol(file_i_j_fpath);
            file_i_j_data = spm_read_vols(file_i_j_hdr);
            file_i_j_data_corrected = file_i_j_data .* mask_data;
            file_i_j_hdr.fname = fullfile(corrected_data_dir, [m_prefixs{j}, t_states{i}]);
            spm_write_vol(file_i_j_hdr, file_i_j_data_corrected);
        end
    end
end