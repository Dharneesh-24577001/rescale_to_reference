#! bin/ bash/

#!/bin/bash


# Loop over all .bed.gz files 
for file in "$@"; do
    # Extract required columns
    zcat "$file" | awk '{print $1"\t"$2"\t"$3"\t"$3 - $2}' >> shuffled.bed
done

# Calculate uniq occurrences
awk '{print $4}' shuffled.bed | sort -n | uniq -c > normalised.tmp
#get sum ie, frequency 
nlines=$(zless normalised.tmp | awk '{nlines+=$1} END{print nlines}')
#to get normalised freq
zless normalised.tmp | awk -v nlines="$nlines" '{print ($2"\t"$1/nlines)}' > normalised2.tmp

paste <(cut -f1,2 normalised2.tmp) <(cut -f2 reference.hist) > normalised3.tmp
#calculating diff to get the max length
cat normalised3.tmp | awk '{print $3-$2}' > just_difference.tsv

paste normalised3.tmp just_difference.tsv > difference.tsv
#creating a proper combined bed file
cat difference.tsv | sort -g -r -k4,4 -k1,1 > normalised.bed


