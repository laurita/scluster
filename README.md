# String Clusterer

String clustering algorithm. The algorithm is hierarchical and unsupervised - basically AGNES. Distance between two strings is Levenshtein distance, normalized by the length of the longer string. The distance between two clusters is the average distance among all string pairs taken from different clusters.  

## Optimization

Because the the complexity of the olgorithm is very high, I used the simple optimization. Before the clustering is started, all equal strings are put in one cluster. 

See `test/test_scluster.rb` for usage instructions.