# Statistical Methods in R to Complement *Statistics for Business and Economics*, 9th Edition, Anderson

The 9th edition of *Statistics for Business and Economics* by Anderson, *et. al*, describes methods
for statistical analysis of data using Excel and Minitab. Here, I will provide the equivalent
methods in the R programming language. I assume you have access to the textbook including the data
provided in the accompanying CD, and the data from the CD should be in a folder `anderson9edata` 
in your working directory. I also assume that this `rstats` repository is cloned into your working 
directory. The name of each example R script is aligned with the corresponding chapter and 
subheading for the same Minitab or Excel method in the textbook. For example, the first R script is titled
`2_1_dotplot.R` and corresponds to the Minitab method described in the section titled *Dot Plot* in
Appendix 2.1, *Using Minitab for Tabular and Graphical Presentations* of the textbook. Finally, I assume
that you have the `xlsx` package available and that it is loaded.

# Convention for Summarized Data

Many times, when Anderson presents data in a table, he includes a summary row with totals for each
column. This is appropriate for presentation of data in a table within a document, but the convention
(especially in R) is to have only observations in rows of a data frame or table. For this
reason, summary rows are computed but kept in separate vectors, data frames, or tables to be combined
with raw or tidy data when data is visualized.

# Convention for Variable Names

I follow the tidy data convention of lower case variable names without spaces.
