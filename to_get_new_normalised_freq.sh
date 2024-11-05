#!/bin/bash

# Calculate the ceiling sum of column 2
sum=$(zless pulling_lines.tsv | awk '{ ceil_value = int($2 + 0.999999); sum += ceil_value } END { print sum }')

# Use the sum to normalize values in column 2
zless pulling_lines.tsv | awk -v sum="$sum" '{ ceil_value = int($2 + 0.999999); print $1 "\t" (ceil_value / sum) }' > Nf_pulling_lines.tsv
#to create a combined file for plotting
paste <(cut -f 1,2 Nf_pulling_lines.tsv) <(cut -f 2,3 normalised.bed ) > Ace.tsv
