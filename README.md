**INSTRUCTIONS**

1.Visit the site "https://figshare.com/s/727f8d920a1b8415f09a" to obtain the shuf.a and shuf.b bed-files using curl.

2.  A combined bed was created from shuf.a.bed.gz and shuf.b.bed.gz, to get the frequency of the query and for further calculations.

3. The maximum length from which the graph is to be pulled was found.

4. A function to pull the neccesary and required no of lengths from the bed files were created to create {x}.bed files.

5. Then new normalised frequency was calculated.

6. Graph was plotted from a combined file "Ace.tsv" with the neccessary colums for plotting to produce the rescaling_to_refernce graph.

**TO RUN THE PROGRAM:**

6. the sankemake is ran with the command, *snakemake --snakefile proj2.smk -j1 --forcerun subsample*
