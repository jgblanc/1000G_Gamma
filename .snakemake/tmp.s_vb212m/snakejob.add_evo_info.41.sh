#!/bin/sh
# properties = {"type": "single", "rule": "add_evo_info", "local": false, "input": ["output/PCA/SAS/SAS_0.01.eigenvec.var"], "output": ["output/PCA/SAS/SAS_0.01.eigenvec.var.evo"], "wildcards": {"POP": "SAS", "MAF": "0.01"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 41, "cluster": {"mem": 16000, "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/add_evo_info.MAF=0.01,POP=SAS.out", "error": "logs/add_evo_info.MAF=0.01,POP=SAS.err", "job-name": "add_evo_info.MAF=0.01,POP=SAS"}}
 cd /project2/jjberg/jgblanc/1000G_Gamma && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake output/PCA/SAS/SAS_0.01.eigenvec.var.evo --snakefile /project2/jjberg/jgblanc/1000G_Gamma/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.s_vb212m output/PCA/SAS/SAS_0.01.eigenvec.var --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules add_evo_info --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.s_vb212m/41.jobfinished || (touch /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.s_vb212m/41.jobfailed; exit 1)
