#remotes::install_github("ColinFay/brochure")
library(shiny)
library(shiny.router)


# Creating a navlink
admin_nav <- tags$ul(
  tags$a(href = route_link("/admin"), "admin home"),
  tags$a(href = route_link("/admin/graphics"), "add graphics"),
  tags$a(href = route_link("/admin/payments-pledges"), "manage payments/pledges")
)



home <- div(
  titlePanel("Dashboard"),
  p("This is a dashboard page")
)

admin_home <- fluidRow(
  column(12,
         admin_nav,
         h1("Admin Home"))
  )

admin_graphics <- fluidRow(
  column(12,
         admin_nav,
         h1("Add Graphics To Your Campaign"),
         fluidRow(
           column(6,
                  fileInput("heroBannerInput",
                            "Choose Hero Banner",
                            accept = c('image/png', 'image/jpeg'))
                  )
         ))
  )

admin_payment_pledges <- fluidRow(
  column(12,
         admin_nav,
         h1("Manage Payments And Pledges"))
  )


router <- router_ui(
  route("/", home),
  route("admin", admin_home),
  route("admin/graphics", admin_graphics),
  route("admin/payments-pledges",admin_payment_pledges)
)

ui <- fluidPage(
  router
)

server <- function(input, output, session) {
  router_server(root_page = "/")
}

shinyApp(ui, server)