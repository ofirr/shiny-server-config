library(shiny)

server <- function(input, output){
}

shinyApp(ui = htmlTemplate("/srv/shiny-server/apps/labs/www/index.html"), server)

