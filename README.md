1. A combined bed was created, to get the frequency of the query and for further calculations.
2. The maximum length from which the graph is to be pulled was found.
3. A function to pull the neccesary and required no of lengths from the bed files were created to create {x}.bed files.
4. Then new normalised frequency was calculated.
5. Graph was plotted from a combined file Ace.tsv with the neccessary colums for plotting to produce the rescaling_to_refernce graph.
6. the sankemake is ran with the command, snakemake --snakefile proj2.smk -j1 --forcerun subsample