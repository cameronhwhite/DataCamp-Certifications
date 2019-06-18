# Load in Libraries

library(tidyverse)

# Read in Certifications
r.certs <- do.call('rbind',lapply(paste('Courses/R/',list.files("Courses/R"),sep=''),read_certification))

python.certs <- do.call('rbind', lapply(paste('Courses/Python/',list.files('Courses/Python'),sep=''),read_certification))

sql.certs <- do.call('rbind',lapply(paste('Courses/SQL/',list.files("Courses/SQL"),sep=''),read_certification))
  
git.certs <- do.call('rbind',lapply(paste('Courses/Git/',list.files("Courses/Git"),sep=''),read_certification))
  
sheets.certs <- do.call('rbind',lapply(paste('Courses/Spreadsheets/',list.files("Courses/Spreadsheets"),sep=''),read_certification))
  
shell.certs <-do.call('rbind',lapply(paste('Courses/Shell/',list.files("Courses/Shell"),sep=''),read_certification)) 

# Combine into single dataset

certs <- bind_rows(list(R = r.certs, Python = python.certs, SQL = sql.certs, Git = git.certs, Spreadsheets = sheets.certs, Shell = shell.certs), .id = 'Language')

# Simplify above process into single function call

