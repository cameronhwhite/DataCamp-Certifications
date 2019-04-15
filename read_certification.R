read_certification <- function(file){
  raw.text <- pdftools::pdf_text(file)
  split.text <- unlist(strsplit(raw.text, "\r"))
  split.text <- gsub("\n", "", split.text)
  Certificate.Number <- as.numeric(gsub("#", "", split.text[1]))
  Course.Name <- split.text[5]
  Date.Completed <- as.Date(split.text[7], format = "%b %d, %Y")
  return(data.frame(Course.Name, Certificate.Number, Date.Completed))
}
