rule all:
    input:"plotted.png"

rule normalised_Freq:
    input:
        shuf=expand("shuf.{i}.bed.gz", i=["a","b"]) 
    output:
        "shuffled.bed",
        "normalised.bed"
    shell:
        "bash to_get_normalised_freq.sh {input.shuf}"

rule line_pulling:
        input:"normalised.bed"
        output:"pulling_lines.tsv"
        shell:"python3 no_of_lines_to_be_pulled.py"

rule subsample:
    input:
        "pulling_lines.tsv", 
        "shuffled.bed"
    params:
        num_files=10
    output:
        expand("{file_num}.bed", file_num=range(1, 11))
    shell:
        "python3 sampling.py {params.num_files}"

rule new_Nfreq:
        input:"pulling_lines.tsv", "normalised.bed"
        output:"Ace.tsv"
        shell:"bash to_get_new_normalised_freq.sh"

rule graphing:
        input:"Ace.tsv"
        output:"plotted.png"
        shell:"python3 graphing.py"
