# code taken from John Helvy
  # website: https://github.com/jhelvy/jhelvy.com
  # blog post: https://www.jhelvy.com/posts/2021-03-25-customizing-distill-with-htmltools-and-css/

library(htmltools)

# create footer
create_footer <- function() {

  fill <- '#ededeb'
  height <- '14px'

  footer <- HTML(paste0(
    '© 2021 Samantha Csik',
    br(),
    fontawesome::fa('wrench', fill = fill, height = height), ' Made with ',
    '
    [',
    fontawesome::fa('code-branch', fill = fill, height = height),
    '](https://github.com/samanthacsik) and the
    [',
    fontawesome::fa('r-project', fill = fill, height = height),
    '](https://cran.r-project.org/) ',
    '[distill](https://github.com/rstudio/distill) package\n',
    br(),
    last_updated(), "\n\n",

    '<!-- Add function to open links to external links in new tab, from: -->',
    '<!-- https://yihui.name/en/2018/09/target-blank/ -->\n\n',
    '<script src="js/external-link.js"></script>'
  ))

  save_raw(footer, "_footer.html")
}

# last updated (date for footer)
last_updated <- function() {
  return(span(
    paste0(
      'Last updated on ',
      format(Sys.Date(), format="%B %d, %Y")
    ),
    style = "font-size:0.8rem;")
  )
}

# write _footer.html to root
save_raw <- function(text, path) {
  fileConn <- file(path)
  writeLines(text, fileConn)
  close(fileConn)
}