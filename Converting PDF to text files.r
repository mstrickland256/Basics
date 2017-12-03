#Location of pdf files
goodpath <- "whatever"

files <- list.files(path = goodpath, pattern = "pdf", full.names = TRUE)

#path here is that of xpdf's pdftotext; for Windows include the .exe extension
lapply(files, function(i) system(paste('"/usr/local/bin/pdftotext"', paste0('"', i, '"')), wait = FALSE))
