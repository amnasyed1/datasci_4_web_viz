# Import necessary libraries
library(shiny)
library(ggplot2)
library(dplyr)

# UI for the Shiny app
ui <- fluidPage(
  titlePanel("Binge Drinking Age-adjusted Prevalence in RI by County"),
  sidebarLayout(
    sidebarPanel(
      selectInput("county", "Choose a county:", choices = NULL)
    ),
    mainPanel(
      plotOutput("barPlot")
    )
  )
)

# Server logic
server <- function(input, output, session) {
  
  # Load the dataset
  df <- reactive({
    url <- "https://raw.githubusercontent.com/amnasyed1/datasci_4_web_viz/main/datasets/PLACES__Local_Data_for_Better_Health__County_Data_RI2023_release.csv"
    read.csv(url)
  })
  
  # Filter the dataset
  df_binge <- reactive({
    data <- df()
    filter(data, MeasureId == "BINGE", Data_Value_Type == "Age-adjusted prevalence")
  })
  
  # Update county choices dynamically based on dataset
  observe({
    binge_data <- df_binge()
    updateSelectInput(session, "county", choices = sort(unique(binge_data$LocationName)))
  })
  
  # Render the bar plot
  output$barPlot <- renderPlot({
    binge_data <- df_binge()
    county_data <- binge_data[binge_data$LocationName == input$county, ]
    avg_value <- mean(binge_data$Data_Value, na.rm = TRUE)
    
    ggplot() +
      geom_bar(data = county_data, aes(x = LocationName, y = Data_Value, fill = LocationName), stat = "identity") +
      geom_hline(aes(yintercept = avg_value), linetype = "dashed", color = "dodgerblue") +
      labs(title = 'Binge Drinking Age-adjusted Prevalence',
           y = 'Data Value (Age-adjusted prevalence) - Percent',
           x = 'Location (County)') +
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
      ylim(0, 30) +
      scale_fill_manual(values = c("lavender", "lemonchiffon"))
  })
  
}

# Run the Shiny app
shinyApp(ui, server)
