#' Set and get Open AI API keys as ENV variable
#'
#' @param openai_api_key Open AI API key/token to set as ENV
#' @export
get_openai_api_key <- function(){
  Sys.getenv("OPENAI_API_KEY")
}

#' @rdname get_openai_api_key
#' @export
set_openai_api_key <-function(openai_api_key){
  Sys.setenv("OPENAI_API_KEY"=openai_api_key)
}
