#remotes::install_github("ColinFay/brochure")
library(brochure)
library(shiny)

# Creating a navlink
admin_nav <- tags$ul(
    tags$a(href = "/admin", "admin home"),
    tags$a(href = "/admin/graphics", "add graphics"),
    tags$a(href = "/admin/payments-pledges", "manage payments/pledges")
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
      admin_nav,
      h1("Admin Home")
    ),
    server = function(input, output, session) {},
    res_handlers = list()
  )
}

admin_graphics <- function(){
  page(
    href = "/admin/graphics",
    ui = tagList(
      admin_nav,
      h1("Add Graphics To Your Campaign")
    ),
    server = function(input, output, session) {},
    res_handlers = list()
  )
}

admin_payment_pledges <- function(){
  page(
    href = "/admin/payments-pledges",
    ui = tagList(
      admin_nav,
      h1("Manage Payments And Pledges")
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
