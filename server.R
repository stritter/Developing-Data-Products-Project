library(shiny)

#diabetesRisk <- function(glucose) glucose / 200

coverage <- function(n=40, nosim=1000, lambda=0.2, alpha=0.05, seed=180){
        # Coverage:Observed percentage that the population mean is in the confidence intervall. 
        # There are nosim sample draws of size n. Nosim calculated confidence intervalls (ci).
        # How often is the population mean in these n calculated ci
        meanone <- meanone(n, nosim, lambda, seed)
        stdone <- stdone(n, nosim, lambda, seed)
        
        set.seed(seed)
        
        c <- numeric()
                a <- 0
                for(i in 1:nosim){    
                        meanonei <- meanone[i]
                        stdonei <- stdone[i]
                        
                        ul <- meanonei + qnorm(1-alpha/2)*stdonei/sqrt(n)
                        ll <- meanonei - qnorm(1-alpha/2)*stdonei/sqrt(n)
                        
                        if(ll<1/lambda & 1/lambda<ul){
                                a <- a+1
                        }
                        c <- a/nosim
                }
                
        
        c
}

meanone <- function(n=40, nosim=1000, lambda=0.2, seed=180){
        set.seed(seed)
        
        # defining matrix
        simulationvector <- numeric(nosim)
        
        # creating random variables
                for (i in 1:nosim){
                        drawrandomvariables <- rexp(n, lambda) 
                        meandrawrandomvariables <- mean(drawrandomvariables) 
                        simulationvector[i] <- meandrawrandomvariables
                } 
        simulationvector
}

stdone <- function(n=40, nosim=1000, lambda=0.2, seed=180){
        set.seed(seed)

        # defining matrix
        simulationvector <- numeric(nosim)
        
        # creating random variables
                for (i in 1:nosim){    
                        drawrandomvariables <- rexp(n, lambda) 
                        stddrawrandomvariables <- sd(drawrandomvariables)
                        simulationvector[i] <- stddrawrandomvariables
                } 
        simulationvector
}

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$n})
    output$inputValue2 <- renderPrint({input$nosim})
    output$inputValue3 <- renderPrint({input$lambda})
    output$inputValue4 <- renderPrint({input$seed})
    output$inputValue5 <- renderPrint({1-input$alpha})
    output$coverage <- renderPrint({coverage(input$n, input$nosim, input$lambda, input$alpha, input$seed)})
  }
)
