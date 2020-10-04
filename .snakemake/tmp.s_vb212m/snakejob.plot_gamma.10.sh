#!/bin/sh
# properties = {"type": "single", "rule": "plot_gamma", "local": false, "input": ["output/gamma/EUR/EUR_0.01.50_5_0.5_gamma.txt"], "output": ["output/figures/EUR/EUR_0.01.50_5_0.5_gamma.png"], "wildcards": {"POP": "EUR", "MAF": "0.01", "window": "50", "step": "5", "thresh": "0.5"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 10, "cluster": {"mem": 16000, "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/plot_gamma.MAF=0.01,POP=EUR,step=5,thresh=0.5,window=50.out", "error": "logs/plot_gamma.MAF=0.01,POP=EUR,step=5,thresh=0.5,window=50.err", "job-name": "plot_gamma.MAF=0.01,POP=EUR,step=5,thresh=0.5,window=50"}}
 cd /project2/jjberg/jgblanc/1000G_Gamma && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake output/figures/EUR/EUR_0.01.50_5_0.5_gamma.png --snakefile /project2/jjberg/jgblanc/1000G_Gamma/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.s_vb212m output/gamma/EUR/EUR_0.01.50_5_0.5_gamma.txt --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules plot_gamma --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.s_vb212m/10.jobfinished || (touch /project2/jjberg/jgblanc/1000G_Gamma/.snakemake/tmp.s_vb212m/10.jobfailed; exit 1)

