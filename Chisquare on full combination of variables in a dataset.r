library(plyr)

combos <- combn(ncol(pain),2)
#Where "pain" is the dataset. Adjust also in four places below as need be.

adply(combos, 2, function(x) {
  test <- chisq.test(pain[, x[1]], pain[, x[2]])

  out <- data.frame("Row" = colnames(pain)[x[1]]
                    , "Column" = colnames(pain[x[2]])
                    , "Chi.Square" = round(test$statistic,3)
                    ,  "df"= test$parameter
                    ,  "p.value" = round(test$p.value, 3)
                    )
  return(out)

})
