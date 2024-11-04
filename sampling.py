import math
import random
from collections import defaultdict

def process_lengths(num_files=1):
    length_freqs = {}

    # Read pulling_lines.tsv manually
    with open("pulling_lines.tsv", "r") as sys:
        for line in sys:
            length, freq = line.strip().split()
            length_freqs[int(length)] = math.ceil(float(freq))

    # Read the 4th column of shuffled.bed once and store it
    arranged_lengths = defaultdict(list)
    with open("shuffled.bed", "r") as f:
        for line in f:
            gene_id, chr_pos1, chr_pos2, length = line.strip().split()
            arranged_lengths[int(length)].append(line.strip())  # Store full line

    for file_num in range(1, num_files + 1):
        selected_lines = []

        # Process the lengths based on length_freqs
        for length, freq in length_freqs.items():
            if length in arranged_lengths:
                # Select random lines from the pre-stored lines for this length
                selected_lines.extend(random.sample(arranged_lengths[length], min(freq, len(arranged_lengths[length]))))

        # Write to the output file
        with open(f"{file_num}.bed", "w") as output_file:
            for line in selected_lines:
                output_file.write(f"{line}\n")

process_lengths(num_files=10)

