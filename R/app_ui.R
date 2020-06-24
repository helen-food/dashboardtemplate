#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    dashboardPage(skin = "green",
                  dashboardHeader(title = "Dashboard title"),
                  dashboardSidebar(
                    sidebarMenu(menuItem("Page 1", tabName = "page1", icon = icon("home")), # available icons at https://fontawesome.com/icons?d=gallery
                                menuItem("Page 2", tabName = "page2", icon = icon("search")),
                                menuItem("Page 3", tabName = "page3", icon = icon("book-open"))
                    )
                  ),
                  dashboardBody(
                    
                    # to include google analytics, save the tracking script in 
                    # the working directory as google-analytics.html, and 
                    # uncomment the code below
                    
                    # tags$head(includeHTML(("google-analytics.html"))),

                    tabItems(
                      
                      # UI for page 1
                      
                      tabItem(tabName = "page1",     
                              h3("Page 1"),
                              wellPanel(
                                p("Welcome to page 1")
                                
                                # add module UI calls below
                                
                                # ...

                              )
                      ),
                      
                      # UI for page 2
                      
                      tabItem(tabName = "page2",
                              h3("Page 2"),
                              wellPanel(
                                p("Welcome to page 2"),
                                br(),
                                p("Here is some more text")
                                
                                # add module UI calls below
                                
                                # ...
                                
                              )
                      ),
                      
                      # UI for page 3
                      
                      tabItem(tabName = "page3",
                              h3("Page 3"), 
                              wellPanel(
                                p("Welcome to page 3")
                                
                                # add module UI calls below
                                
                                # ...
                              )
                      )
                      
                    ) #end of tab items
                  ) #end of dashboard body
              ) #end of dashboard page
  ) #end of tag list
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'dashboardtemplate'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

