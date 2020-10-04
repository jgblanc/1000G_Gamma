#!/bin/sh
# properties = {"type": "single", "rule": "plot_pca", "local": false, "input": ["output/PCA/AA/AA_0.01.eigenvec"], "output": ["output/figures/AA/AA_0.01_PCA.png"], "wildcards": {"POP": "AA", "MAF": "0.01"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 6, "cluster": {"mem": 16000, "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/plot_pca.MAF=0.01,POP=AA.out", "error": "logs/plot_pca.MAF=0.01,POP=AA.err", "job-name": "plot_pca.MAF=0.01,POP=AA"}}
 cd /project2/jjberg/jgblanc/1000G_Gamma && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake output/figures/AA/AA_0.01_PCA.png --snakefile /project2/jjberg/jgblanc/1000G_Gamma/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.s_vb212m output/PCA/AA/AA_0.01.eigenvec --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules plot_pca --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.s_vb212m/6.jobfinished || (touch /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.s_vb212m/6.jobfailed; exit 1)

