#' Open AI Chat API
#'
#' @param propt Character string to supply to Open AI chat.
#' @param openai_api_key An Open AI API key token.
#' @param model The model to use. See details below.
#' @param chat_args Further arguments to supply (excluding message and model).
#' See details below.
#'
#' @details
#' Details on models can be found here:
#' \url{https://platform.openai.com/docs/models}
#'
#' Open AIs chat documentation can be found here:
#' \url{https://platform.openai.com/docs/api-reference/chat}
#'
#' Further arguments to the chat API can be found here:
#' \url{https://platform.openai.com/docs/api-reference/chat/create}
#'
#' @examples
#'
#' \dontrun{
#' # Set the Open AI API token here:
#' set_open_ai_api_key("[YOUR KEY GOES HERE]")
#' # Test the API
#' openai_chat("Who is Gustav Vasa?")
#' # Test the API with specific arguments:
#' openai_chat("Who is Gustav Vasa?", chat_args = list(temperature = 0))
#' }
#' @export
openai_chat <- function(prompt, openai_api_key = get_openai_api_key(), model = "gpt-3.5-turbo", chat_args = NULL) {
  checkmate::assert_string(prompt)
  checkmate::assert_string(openai_api_key)
  if(nchar(openai_api_key) == 0) stop("No OpenAI API key supplied.")
  checkmate::assert_string(model)
  checkmate::assert_list(chat_args, null.ok = TRUE)

  response <- httr::POST(
    url = "https://api.openai.com/v1/chat/completions",
    httr::add_headers(Authorization = paste("Bearer", openai_api_key)),
    httr::content_type_json(),
    encode = "json",
    body = c(list(
      model = model,
      messages = list(list(
        role = "user",
        content = prompt
      ))),
      chat_args)
  )
  res <- httr::content(response)
  class(res) <- c("open_ai_chat_api", "open_ai_api", "list")
  res
}

#' @export
print.open_ai_chat_api <- function(x,...){
  for(i in seq_along(x$choices)){
    cat(x$choices[[i]]$message$role, ":\n", x$choices[[i]]$message$content, sep = "")
  }
}
