#! /bin/bash
source mbv-pipe.cfg

data_fpath=$1
matlab -nodisplay -r "run_smooth('${data_fpath}', '${smooth_size}'); exit();"