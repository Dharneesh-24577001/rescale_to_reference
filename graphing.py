import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
#read the file
data_df = pd.read_csv("Ace.tsv", sep = "\t", header = None)
data_df.columns=['len', 'rescaled', 'query', 'ref']
#naming and reshaping df comfortable enough to plot
long_df = pd.melt(data_df, id_vars=['len'], value_vars=['rescaled', 'query', 'ref'],var_name='Type', value_name='Nfreq')
#colors
color_palette = sns.color_palette(["red", "orange", "green"])
sns.set_palette(color_palette)

plt.title('Rescaling_distribution')

sns.lineplot(x='len', y= 'Nfreq', hue= 'Type', data= long_df)
#save
plt.savefig("plotted.png")

plt.show()
