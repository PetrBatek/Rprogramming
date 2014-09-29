source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

library(rhdf5)
created = h5createFile("example.h5")
created

##Create Groups

createdG = h5createGroup("example.h5","foo")
createdG = h5createGroup("example.h5","baa")
createdG = h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")

##Write to groups
A = matrix (1:10,nr=5,nc=2)
h5write(A, "example.h5","foo/A")
B = array(seq(0.1,2.0,by=0.1), dim=c(5,2,2))
attr(b,"scale") <- "liter"
h5write(B, "example.h5","foo/foobaa/B")
h5ls("example.h5")