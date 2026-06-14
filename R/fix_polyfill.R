html_files <- list.files("docs", pattern = "\\.html$", recursive = TRUE, full.names = TRUE)

for (f in html_files) {
  content <- readLines(f, warn = FALSE)
  fixed <- gsub(
    "https://polyfill\\.io/",
    "https://cdnjs.cloudflare.com/polyfill/",
    content,
    fixed = FALSE
  )
  if (!identical(content, fixed)) {
    writeLines(fixed, f)
    message("Patched: ", f)
  }
}
