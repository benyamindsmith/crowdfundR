#remotes::install_github("ColinFay/brochure")
library(brochure)
library(shiny)

# Creating a navlink
admin_nav <- tags$ul(
  tags$li(
    tags$a(href = "/admin", "home"),
  ),
  tags$li(
    tags$a(href = "/admin/graphics", "add graphics"),
  ),
  tags$li(
    tags$a(href = "/admin/payments-pledges", "manage payments/pledges"),
  )
)

home <- function() {
  page(
    href = "/",
    ui = tagList(),
    server = function(input, output, session) {}
  )
}

admin_home <- function() {
  page(
    href = "/admin",
    ui = tagList(
      admin_nav
    ),
    server = function(input, output, session) {},
    res_handlers = list()
  )
}

admin_graphics <- function(){
  page(
    href = "/admin/graphics",
    ui = tagList(
      admin_nav
    ),
    server = function(input, output, session) {},
    res_handlers = list()
  )
}

admin_payment_pledges <- function(){
  page(
    href = "/admin/payments-pledges",
    ui = tagList(
      admin_nav
    ),
    server = function(input, output, session) {},
    res_handlers = list()
  )
}
brochureApp(
  # Pages
  home(),
  admin_home(),
  admin_graphics(),
  admin_payment_pledges()
)
