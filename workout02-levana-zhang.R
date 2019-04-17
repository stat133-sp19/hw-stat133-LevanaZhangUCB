library(shiny)
library(ggplot2)


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Investment Scenario Simulation"),
  
  # Widgets
  column(4,
    sliderInput("initial",
      "Initial Amount",
      min = 0,
      max = 100000,
      value = 1000,
      step = 500),
    sliderInput("contrib",
      "Annual Contribution",
      min = 0,
      max = 50000,
      value = 2000,
      step = 500)
  ),
  column(4, 
    sliderInput("return",
      "Return Rate (in %)",
      min = 0,
      max = 20,
      value = 5,
      step = 0.1),
    sliderInput("growth",
      "Growth Rate (in %)",
      min = 0,
      max = 20,
      value = 2,
      step = 0.1)
  ),
  column(4, 
    sliderInput("years",
      "Years",
      min = 0,
      max = 50,
      value = 20,
      step = 1),
    selectInput("facet", label = "Facet?", 
      choices = list("No" = 1, "Yes" = 2), 
      selected = 1)
      ),
  
# Outputs
  mainPanel(h4("Timelines"),
    plotOutput("time_graph"),
    h4("Balances"),
    dataTableOutput("balances")
    )
)


# Define server logic required to draw the plot
server <- function(input, output) {

## TIMELINE GRAPH
   ##TITLE
  ## functions
  #' @title future_value
  #' @description determines value of investment at a given annual rate of return after a given amount of years
  #' @param amount numeric value
  #' @param rate numeric value
  #' @param years numeric value
  #' @return value of investment after a given amount of years at given rate
  future_value <- function(amount,rate,years){
    fv <- amount*(1+rate)^years
    return(fv)
  }
  
  #' @title annuity
  #' @description determines value of annuity after a given amount of years if annuity is a fixed money amount deposited yearly at a given annual rate of return
  #' @param contrib numeric value
  #' @param rate numeric value
  #' @param years numeric value
  #' @return value of annuity after a given amount of years at given rate
  annuity <- function(contrib,rate,years){
    fva <- contrib*((((1+rate)^years)-1)/rate)
    return(fva)
  }
  #' @title growing_annuity
  #' @description determines value of annuity after a given amount of years if annuity is a money amount, deposited yearly, that grows yearly based on a given annual growth rate, at a given annual rate of return
  #' @param contrib numeric value
  #' @param rate numeric value
  #' @param growth numeric value
  #' @param years numeric value
  #' @return value of annuity after a given amount of years at given rate
  growing_annuity <- function(contrib,rate,growth,years){
    fvga <- contrib*((((1+rate)^years)-((1+growth)^years))/(rate-growth))
    return(fvga)
  }
  output$time_graph <- renderPlot({
   
   ## code for preparing plot
    years <- input$years
    amount <- input$initial
    contrib <- input$contrib
    rate <- input$return*0.01
    growth <- input$growth*0.01
    if (rate == 0){
      mode_1 <- c(1:(years+1))
      mode_1[1] <- amount
      for (i in 2:(years+1)){
        amount <- future_value(amount,rate,1)
        mode_1[i] <- amount
      }
      modality_graph <- data.frame(
        year = c(0:years),
        modality = c(rep("no contribution",(years+1))),
        amount = mode_1
      )
    }
    else {
      mode_1 <- c(1:(years+1))
      mode_1[1] <- amount
      for (i in 2:(years+1)){
        amount <- future_value(amount,rate,1)
        mode_1[i] <- amount
      }
      amount <- input$initial
      contrib <- input$contrib
      mode_2 <- c(1:(years+1))
      mode_2[1] <- amount
      for (i in 2:(years+1)){
        amount <- future_value(amount,rate,1)
        contrib <- annuity(contrib,rate,1)
        amount <- amount + contrib
        mode_2[i] <- amount
      }
      amount <- input$initial
      contrib <- input$contrib
      mode_3 <- c(1:(years+1))
      mode_3[1] <- amount
      for (years3 in 1:(years)){
        amount <- future_value(amount,rate,1)
        mode_3[years3+1] <- amount + growing_annuity(contrib,rate,growth,years3)
      }
      no_contrib_graph <- data.frame(
        year = c(0:years),
        modality = c(rep("no contribution",(years+1))),
        amount = mode_1
      )
      fixed_contrib_graph <- data.frame(
        year = c(0:years),
        modality = c(rep("fixed contribution",(years+1))),
        amount = mode_2
      )
      growing_contrib_graph <- data.frame(
        year = c(0:years),
        modality = c(rep("growing contribution",(years+1))),
        amount = mode_3
      )
      modality_graph <- rbind(no_contrib_graph,fixed_contrib_graph,growing_contrib_graph)
      factor(modality_graph["modality"])
    }
    # code for plot itself
    if (input$facet == 2) {
      ggplot(data = modality_graph, aes(x = year, y = amount)) + 
        geom_line(aes(color = modality)) + 
        geom_point(aes(color = modality,shape = modality)) +
        geom_area(aes(color = modality)) +
        ggtitle("Three Modes of Investing") +
        facet_wrap(~ modality)
    }
    else {
      ggplot(data = modality_graph, aes(x = year, y = amount)) + 
        geom_line(aes(color = modality)) + 
        geom_point(aes(color = modality,shape = modality)) +
        ggtitle("Three Modes of Investing")
    }
  })
  
## BALANCE TABLE
  ## TITLE
  output$balances <- renderDataTable({
    years <- input$years
    amount <- input$initial
    contrib <- input$contrib
    rate <- input$return*0.01
    growth <- input$growth*0.01
    if (rate == 0){
      mode_1 <- c(1:(years+1))
      mode_1[1] <- amount
      for (i in 2:(years+1)){
        amount <- future_value(amount,rate,1)
        mode_1[i] <- amount
      }
      modalities <- data.frame(
        year = c(0:years),
        no_contrib = mode_1
      )
    }
    else {
      mode_1 <- c(1:(years+1))
      mode_1[1] <- amount
      for (i in 2:(years+1)){
        amount <- future_value(amount,rate,1)
        mode_1[i] <- amount
      }
      amount <- input$initial
      contrib <- input$contrib
      mode_2 <- c(1:(years+1))
      mode_2[1] <- amount
      for (i in 2:(years+1)){
        amount <- future_value(amount,rate,1)
        contrib <- annuity(contrib,rate,1)
        amount <- amount + contrib
        mode_2[i] <- amount
      }
      amount <- input$initial
      contrib <- input$contrib
      mode_3 <- c(1:(years+1))
      mode_3[1] <- amount
      for (years3 in 1:(years)){
        amount <- future_value(amount,rate,1)
        mode_3[years3+1] <- amount + growing_annuity(contrib,rate,growth,years3)
      }
      modalities <- data.frame(
        year = c(0:years),
        no_contrib = mode_1,
        fixed_contrib = mode_2,
        growing_contrib = mode_3
      )
    }
    modalities
  })
}

# Run the application 
shinyApp(ui = ui, server = server)