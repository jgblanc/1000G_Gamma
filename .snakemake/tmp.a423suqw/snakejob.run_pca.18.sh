#!/bin/sh
# properties = {"type": "single", "rule": "run_pca", "local": false, "input": ["1kg_IDS/EUR.txt"], "output": ["output/PCA/EUR/EUR_0.01.eigenvec", "output/PCA/EUR/EUR_0.01.eigenvec.var"], "wildcards": {"POP": "EUR", "MAF": "0.01"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 18, "cluster": {"account": "pi-jjberg", "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/run_pca.MAF=0.01,POP=EUR.out", "error": "logs/run_pca.MAF=0.01,POP=EUR.err", "job-name": "run_pca.MAF=0.01,POP=EUR"}}
 cd /project2/jjberg/jgblanc/1000G_Gamma && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake output/PCA/EUR/EUR_0.01.eigenvec --snakefile /project2/jjberg/jgblanc/1000G_Gamma/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.a423suqw 1kg_IDS/EUR.txt --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules run_pca --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.a423suqw/18.jobfinished || (touch /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.a423suqw/18.jobfailed; exit 1)

