
print("Im running")
# Open file with D/A info and create a dictionary that has key=chrom:pos and key_value=derived_allele
filepath = "../../data/1kg/1kg_phase3_snps.tsv"
da_dict = {}
with open(filepath) as fp:
    line = fp.readline()
    while line:
        line = line.strip()
        line_list = line.split()
        key = line_list[0] + ":" + line_list[1]
        key = line_list[2]
        key_value_allele = line_list[9]
        da_dict[key] = key_value_allele
        line = fp.readline()        
print("Made Dictionary") 

# Open eigenvec.var file and add column ( 1 if A2 is derived and -1  if A1 is ancestral)                                                                                  
filepath_GWAS = snakemake.input[0]
new_file_lines = []
with open(filepath_GWAS) as fp:
    line = fp.readline()
    while line:
        line = line.strip()
        line_list = line.split()
        SNP = line_list[1]
        A1 = line_list[2]
        A2 = line_list[3]
        try:
            DA = da_dict[SNP]
            if DA == A1:
                new_entry = "-1"  
            elif DA == A2:
                new_entry = "1"
            else:
                new_entry = "NA"
        except KeyError:
            new_entry = "NA"
        line_list.append(new_entry)
        new_line = ",".join(line_list)
        new_file_lines.append(new_line)
        line = fp.readline()
print("Matched file")


# Re-write loadings  with column that says if effect allele is derieved
outpath=snakemake.output[0]
with open(outpath, "w") as doc:
    doc.writelines("%s\n" % place for place in new_file_lines)

print("Wrote new file")
