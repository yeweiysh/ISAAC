# ISAAC
Wei Ye (ye@dbs.ifi.lmu.de)

Wei Ye, Samuel Maurus, Nina Hubig and Claudia Plant, Generalized Independent Subspace Clustering, INternational Conference 0n Data Mining, 2016

our algorithm ISAAC is based on the following two toolboxes:
1. Information Theoreticl Estimators Toolbox (ITE) https://bitbucket.org/szzoli/ite/downloads
2. Kernel Density Estimation Toolbox (to make ISAAC run more faster) http://www.ics.uci.edu/~ihler/code/kde.html
isaac is the main method. The input data is in the .txt format. Each row is an object and each column is an attribute. 
And the last column is the cluster label (for multiple clustering data, the last k columns are cluster labels). 
The output is the F1 value. 
