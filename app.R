#remotes::install_github("ColinFay/brochure")
library(brochure)
library(shiny)

# Creating a navlink
nav_links <- tags$ul(
  tags$li(
    tags$a(href = "/", "home"),
  ),
  tags$li(
    tags$a(href = "/login", "login"),
  ),
  tags$li(
    tags$a(href = "/logout", "logout"),
  )
)

home <- function() {
  page(
    href = "/",
    ui = tagList(
      h1("This is my first page"),
      tags$p("It will contain BROCHURECOOKIE depending on the last page you've visited (/login or /logout)"),
      verbatimTextOutput("cookie"),
      nav_links
    ),
    server = function(input, output, session) {
      output$cookie <- renderPrint({
        parse_cookie_string(
          get_cookies()
        )
      })
    }
  )
}

login <- function() {
  page(
    href = "/login",
    ui = tagList(
      h1("You've just logged!"),
      verbatimTextOutput("cookie"),
      actionButton("redirect", "Redirect to the home page"),
      nav_links
    ),
    server = function(input, output, session) {
      output$cookie <- renderPrint({
        parse_cookie_string(
          get_cookies()
        )
      })
      observeEvent(input$redirect, {
        # Using brochure to redirect to another page
        server_redirect("/")
      })
    },
    res_handlers = list(
      # We'll add a cookie here
      ~ set_cookie(.x, "BROCHURECOOKIE", 12)
      # If you had to do it yourself
      # function(res, req){
      #   res$headers$`Set-Cookie` <- "BROCHURECOOKIE=12; HttpOnly;"
      #   res
      # }
    )
  )
}

logout <- function() {
  page(
    href = "/logout",
    ui = tagList(
      h1("You've logged out"),
      nav_links,
      verbatimTextOutput("cookie")
    ),
    server = function(input, output, session) {
      output$cookie <- renderPrint({
        parse_cookie_string(
          get_cookies()
        )
      })
    },
    res_handlers = list(
      # We'll remove the cookie here
      ~ remove_cookie(.x, "BROCHURECOOKIE")
      # If you had to do it yourself
      # function(res, req){
      #   res$headers$`Set-Cookie` <- "BROCHURECOOKIE=''; Max-Age = 0;"
      #   res
      # }
    )
  )
}

brochureApp(
  # Pages
  home(),
  login(),
  logout()
)