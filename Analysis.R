# Load in Libraries

library(tidyverse)

# Read in Certifications
r.certs <- do.call('rbind',lapply(paste('Courses/R/',list.files("Courses/R"),sep=''),read_certification))

python.certs <- do.call('rbind', lapply(paste('Courses/Python/',list.files('Courses/Python'),sep=''),read_certification))

sql.certs <- do.call('rbind',lapply(paste('Courses/SQL/',list.files("Courses/SQL"),sep=''),read_certification))
  
git.certs <- do.call('rbind',lapply(paste('Courses/Git/',list.files("Courses/Git"),sep=''),read_certification))
  
sheets.certs <- do.call('rbind',lapply(paste('Courses/Spreadsheets/',list.files("Courses/Spreadsheets"),sep=''),read_certification))
  
shell.certs <- do.call('rbind',lapply(paste('Courses/Shell/',list.files("Courses/Shell"),sep=''),read_certification)) 

# Combine into single dataset

certs <- bind_rows(list(R = r.certs, Python = python.certs, SQL = sql.certs, Git = git.certs, Spreadsheets = sheets.certs, Shell = shell.certs), .id = 'Language')

# Simplify above process into single function call

read_all_certs <- function(languages = c('R','Python','SQL','Spreadsheets','Shell','Git')){
  file_paths <- paste('Courses/',languages, '/', sep = '')
  cert_list <- list()
  length(cert_list) <- length(languages)
  names(cert_list) <- languages
  for(i in 1:length(languages)){
    cert_list[[i]] <- do.call('rbind',lapply(paste(file_paths[i],list.files(file_paths[i]),sep=''),read_certification)) 
  }
  return(dplyr::bind_rows(cert_list, .id = 'Language'))
}

