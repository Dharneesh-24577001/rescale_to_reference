import pandas as pd
#read bed file
dataset= pd.read_csv('normalised.bed', sep= '\t', header= None)
#assign names for col
dataset.columns=['length', 'query', 'reference', 'diff']
#getting the max_length
maximum_of_query= dataset['reference'].max()

length_with_max_diff = dataset.loc[0,'length']
#checking max length
print(length_with_max_diff)
#new file details
dataset['lines_to_be_pulled']= (dataset['reference']/maximum_of_query)*length_with_max_diff
#snew column names
dataset_to_save= dataset[['length', 'lines_to_be_pulled']]
#saving
dataset_to_save.to_csv('pulling_lines.tsv', sep= '\t', index=False, header= None)
