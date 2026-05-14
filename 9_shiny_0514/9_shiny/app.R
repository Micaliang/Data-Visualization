
setwd("C:/Users/PC 14 - MAKMAL BETA/Desktop/P156872")
library(shiny)

# ui:a user interface object-controls the layout and appearance of your app.
# server: a function contains the instruction that your computer needs to build your app.
# shiny App: a function that creates the app-connects ui and server.

ui<-fluidPage(
  titlePanel("My first shiny app:)"),
  sidebarPanel("This is the side bar."),
  mainPanel("This is the main part.")
)
  
server<-function(input,output){
  
}
  
shinyApp()
runApp("app")
