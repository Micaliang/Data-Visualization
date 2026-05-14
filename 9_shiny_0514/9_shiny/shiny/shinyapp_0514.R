
setwd("C:/Users/PC 15/Desktop/9_shiny/9_shiny")
library(shiny)

# ui:a user interface object-controls the layout and appearance of your app.
# server: a function contains the instruction that your computer needs to build your app.
# shiny App: a function that creates the app-connects ui and server.

ui<-fluidPage(
  titlePanel("My first shiny app:)"),
  sidebarLayout(position = "right",
  sidebarPanel("This is the side bar."),
  mainPanel("This is the main part.")
))
  
server<-function(input,output){
  
}
  
shinyApp(ui=ui,server = server)

#EP2

ui<-fluidPage(
  titlePanel("STQD6124"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h6("Data Visualization",align="center"),
      h5("Year:2026,Month:May",align="center"),
      h4("Semester II, Academic Session 2025/2026",align="center"),
      h3("Location:Makmal Beta,Level1",align="center"),
      h2("Department of Mathmatical Sciences",align="center"),
      h1(strong("UKM"),em("All the Best"),align="center"))
      
    )
  )

server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)

#EP3（研究一下路径！！）
ui<-fluidPage(
  addResourcePath(
    prefix = "media",
    directoryPath = "C:\Users\PC 14 - MAKMAL BETA\Desktop\P156872\shiny\www"),
  titlePanel("builin-myself"),
    mainPanel(
      p("If you need some one to cry"),
      p("Just cry on my shoulder"),
      p("I don't care who is doing better than me."),
      p(code("Because the true is, i am not compatetion with anyone else.")),
      div("Mister, I'll make a man out of you.",style="color:red"),
      br(),
      p("Because the true is, i am not compatetion with anyone else."),
      p("The only person",span("i need to be better than is the person i was yesterday.",style="color:red"),
        "I hope all the best."),
      p("Yesterday, i was different, i have growth,i have improve!.",style="color:red"),
      
      img(src = "mulan1.png"),
      tags$audio(src="mulan.mp3",type="audio/mp3",autoplay=NA,controls=NA)
))

server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)



# EP4

ui<-fluidPage(
  titlePanel("Widegets"),
  sidebarLayout(
  sidebarPanel(
  h3("Buttons"),
  br(),
  br(),
  actionButton("button","button 1"),
  br(),
  br(),
  submitButton("Submit")
  ),
  mainPanel()
)
)

server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)


# EP5
ui<-fluidPage(
  titlePanel("Widegets"),
  # 1st Row
  fluidRow(
    column(3,h3("Checkbox"),
    checkboxInput("Check1","Chocolate",value = T),
    checkboxInput("Check2","Strewberry"),
    checkboxInput("Check3","Vanilla")),
    
    column(3,
    checkboxGroupInput("checks",h3("Another Checkbox"),
    choices = list("KFC"=1,"McD"=2,"Texas Chicken"=3),selected = 1))
),
    # 2ed Row
  fluidRow(
    column(5,
           dateInput("date",h3("Insert a Date"),value = "2026-5-12")),
    
    column(5,
           dateRangeInput("dates",h3("Insert a Duration")))
  ),

  #3rd Row
  fluidRow(
    column(4,
           fileInput("file",h3("Upload File"))),

    column(4,
           numericInput("number",h3("Insert a number:"),value = 3)),
    column(4,
           textInput("texts",h3("Insert Full Name:"),value = "My name is..."))
),

  #4th Row
  fluidRow(
    column(4,
    radioButtons("Radio",h3("Choose"),
    choices = list("Horror","Action","Comedy"),
    selected = "Comedy")),
    
    column(4,
    selectInput("select",h3("Select"),
    choices = list("R"=1,"Python"=2,"Java"=3),
    selected = 3)),
    
    column(4,
    sliderInput("slider",h3("Choose a Range"),
    min = 0,max = 50,value = c(3,30)))
    )
)

server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)


# EP6
ui<-fluidPage(
  titlePanel("Examples"),
  
sidebarLayout(
sidebarPanel(fluidRow(
  column(7,
  radioButtons("radio",h3("Choose"),
  choices=list("Horror","Action","Comedy"),selected = "Comedy")),
  
  column(7,
  selectInput("select",h3("Select"),
  choices = list("R","Python","Java"),selected = "Java")),

  column(7,
  sliderInput("slider",h3("Choose a Range"),
  min=0,max = 50,value = c(3,30))))),

mainPanel(
  textOutput("myradio"),
  textOutput("myselect"),
  textOutput("myslider"))
))

server<-function(input,output){
  output$myradio<-renderText({
    paste("You have selected a ", input$radio,"as your choice of movie genre.")
  })
  
  output$myselect<-renderText({
    paste("You prefer to continue with", input$select,"progrmming.")
  })
  
  output$myslider<-renderText({
    paste("Your prefered range is between", input$slider[1],"and", input$slider[2])
  })
}

shinyApp(ui=ui,server = server)

# textOutput(),plotOutput(),imageOutput(),plotlyOutput(),uiOutput(),dataTableOutput()
# renderText(),renderPlot(),renderImage(),renderplotly(),


# Exercise 1
ui<-fluidPage(
titlePanel("New Membership"),

fluidRow(
  column(3,
  dateInput("date",h3("Insert Today's Date"),value = "2026-05-14")),
  
  column(3,
  radioButtons("gender",h3("Gender"),
  choices = c("Male","Female"),selected = "Male")),
  
  column(3,
  textInput("name",h3("Full name:"),value = "Full Name")),
  
  column(3,
  numericInput("age",h3("Age:"),value = 20))
),

  textOutput("newdate"),
  textOutput("newmember")

)

server<-function(input,output){
  output$newdate<-renderText({
    paste("A new membership in registered on ",input$date)})
  
  output$newmember<-renderText({
    paste(input$gender,"named",input$name,"of age",input$age,"is recored.")
  })
}

shinyApp(ui=ui,server = server)


# Exercise 2
library(ggplot2)
library(RColorBrewer)

marvel<-read.csv("Marvel.csv",header = T)

ui<-fluidPage(
  titlePanel("Marvel Character"),
  
  column(7,
         selectInput("select",h3("Select Criteria"),
          choices = c("Durability","Strength","Fighting","Speed","Energy","Intelligence"),
          selected = "Intelligence")),
  
          textOutput("mytitle"),
          plotOutput("mcu"))
 
  
server<-function(input,output){
  output$mytitle<-renderText({
    paste("Bar Chart for ",input$select,"of Marvel Characters")})
    
    output$mcu<-renderPlot({
      ndata<-switch (input$select,
        "Durability" = marvel$Durability,
        "Strength"=marvel$Strength,
        "Fighting"=marvel$Fighting,
        "Speed"=marvel$Speed,
        "Energy"=marvel$Energy,
        "Intelligence"=marvel$Intelligence)
      
    new<-data.frame(marvel$Character,ndata)
    names(new)<-c("Character","Criteria")
    
    mypal<-colorRampPalette(brewer.pal(9,"Set1"))(23)
    ggplot(new,aes(x=Character,y=Criteria))+
      geom_bar(stat = "identity",aes(fill=Character))+
      theme(axis.text.x = element_text(angle = 90,vjust=0.5))+
      scale_fill_manual(values = mypal)
    })
}

shinyApp(ui=ui,server = server)


# Exercise 3（还没讲）
ui<-fluidPage(
  titlePanel("Widegets"),
)

server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)






































