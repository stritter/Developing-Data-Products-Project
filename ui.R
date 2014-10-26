library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Coverage probability of the exponential distribution"),
  
    sidebarPanel(
      numericInput('n', 'Sample size', 40, min = 1, max = 10000, step = 1),
      numericInput('nosim', 'Number of simulations', 1000, min = 1, max = 10000, step = 1),
      numericInput('lambda', 'Lambda', 0.02, min = 0.000001, max = 1000000, step = 0.01),
      numericInput('alpha', 'Alpha', 0.05, min = 0.01, max = 0.10, step = 0.01),
      numericInput('seed', 'Seed', 1, min = 1, max = 1000000, step = 1),
      submitButton('Submit')
    ),
    mainPanel(
        h3('Results of the simulation'),
        h4('Sample size'),
        verbatimTextOutput("inputValue"),
        h4('Number of simulations'),
        verbatimTextOutput("inputValue2"),
        h4('Lambda'),
        verbatimTextOutput("inputValue3"),
        h4('Seed'),
        verbatimTextOutput("inputValue4"),
        h4('Theoretical coverage: 1-Alpha'),
        verbatimTextOutput("inputValue5"),
        h4('Empirical coverage based on simulation'),
        verbatimTextOutput("coverage"),
        h3('Documentation'),
        h4('Simulation of the coverage probability of the exponential distribution'),

		p('Compare the empirical with theoretical coverage probability.'),

		p('The app calculates the empirical coverage of a number of samples (number of simulations). The empirical mean and (1-alpha) % confidence interval of each sample is calculated. Then the app counts how often the theoretical mean (1/lambda), i.e. population mean of the exponential distribution, is in the calculated confidence interval of each sample. The percentage, i.e. the count that the population mean is in the confidence interval divided by the number of simulations, is the result the app displays in the main panel.'),

		p('Enter the values for the variables defining the simulation on the sidebar panel.'),

		p('The seed value makes it possible to reproduce the results.'),

		p('The main panel shows the values for the variables and the empirical coverage of the simulation after pressing the submit button.'),

		p('A simple approximation to the exact interval endpoints of the exponential distribution can be derived using a normal approximation. This approximation is used to compute the values for a (1-alpha)% confidence interval.')
       
    )
  )
)

