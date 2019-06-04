certs <- do.call('rbind',lapply(paste('Courses/R/',list.files("Courses/R"),sep=''),read_certification))
