numInts <- 100000

timings1 <- vector(mode = "double", 100)
for (i in 1:100) {
    start <- Sys.time()
    v <- vector(mode = "double", 0)
    for (j in 1:numInts) {v[j] <- j;}
    end <- Sys.time()
    timings1[[i]] <- end - start
}
mean(timings1)

timings2 <- vector(mode = "double", 100)
for (i in 1:100) {
    start <- Sys.time()
    v <- vector(mode = "double", numInts)
    for (j in 1:numInts) {v[j] <- j;}
    end <- Sys.time()
    timings2[[i]] <- end - start
}
mean(timings2)
