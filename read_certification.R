read_certification <- function(file){
  raw.text <- pdftools::pdf_text(file)
  split.text <- unlist(strsplit(raw.text, "\r"))
  text.len <- length(split.text)
  split.text <- gsub("\n", "", split.text)
  Certificate.Number <- readr::parse_number(split.text[1])
  if(text.len < 8){
   Course.Name <- paste(split.text[3], collapse=' ')
   Date.Completed <- NA    
  } else{
  Course.Name <- paste(split.text[5:(text.len-3)], collapse=' ')
  Date.Completed <- as.Date(split.text[text.len-1], format = "%b %d, %Y")
  }
  return(data.frame(Course.Name, Certificate.Number, Date.Completed, stringsAsFactors = FALSE))
}
