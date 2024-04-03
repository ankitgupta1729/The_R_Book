# 1.8 Data editor
# There is a data editor within R that can be accessed from the menu bar by selecting Edit/Data editor . . . .
# You provide the name of the matrix or dataframe containing the material you want to edit (this has to be
#                                                                                           a dataframe that is active in the current R session, rather than one which is stored on file), and a Data
# Editor window appears. Alternatively, you can do this from the command line using the fix function (e.g.
#                                                                                                     fix(data.frame.name)). Suppose you want to edit the bacteria dataframe which is part of the MASS
# library:

library(MASS)
attach(bacteria)
fix(bacteria)