#' Create a html widget for the data viewer
#' @param data json string or list
#' @import htmlwidgets
#' @import rjson
#' @export
dataGraph <- function(data, group = FALSE,
                  width = NULL, height = NULL) {

    if (is.list(data)) {
        data <- toJSON(data)
    }

    # create a list that contains the settings
    settings <- list(
        group = group
    )

    # pass the data and settings using 'x'
    x <- list(
        data = data,
        settings = settings
    )

    # create the widget
    return(htmlwidgets::createWidget("dviewer", x, width = width, height = height))
}

#' test the dviewer using the test data
#' @export
testDviewer <- function () {
    dataGraph(test_data)
}

#' set up demo with data
#'
#' Copy loaded R test_data to the demo_data.js file.
#' @details
#' Use this function to replace the demo_data.js inside the library, so that it can be used for debugging the javascript.
#'
#' @export
demoData <- function () {

    fileConn<-file('inst/htmlwidgets/lib/dviewer-0.0.1/demo/data/demo_data.js')
    demo_data <- paste("var demo_data = JSON.parse('", test_data, "');")
    writeLines(demo_data, fileConn)
    close(fileConn)

}





