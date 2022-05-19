if (!("dirs" %in% ls())) { source("Analysis/00_setup.R") }
script.var <- ___
script.var.state <- get.redo.state(script.var)
if (is.null(script.var.state)) {
  assign.redo(script.var, state = default.redo.state)
}

##

