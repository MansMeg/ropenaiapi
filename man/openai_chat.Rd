% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/openai_chat.R
\name{openai_chat}
\alias{openai_chat}
\title{Open AI Chat API}
\usage{
openai_chat(
  messages,
  openai_api_key = get_openai_api_key(),
  model,
  chat_args = NULL
)
}
\arguments{
\item{messages}{Either a character string to supply to Open AI chat as role
'user' or a list of list with role and messages. See below for an example.}

\item{openai_api_key}{An Open AI API key token.}

\item{model}{The model to use. See details below.}

\item{chat_args}{Further arguments to supply (excluding message and model).
See details below.}
}
\description{
Open AI Chat API
}
\details{
Details on models can be found here:
\url{https://platform.openai.com/docs/models}

Open AIs chat documentation can be found here:
\url{https://platform.openai.com/docs/api-reference/chat}

Further arguments to the chat API can be found here:
\url{https://platform.openai.com/docs/api-reference/chat/create}
}
\examples{

\dontrun{
# Set the Open AI API token here:
set_open_ai_api_key("[YOUR KEY GOES HERE]")

# Test the API
openai_chat("Who is Gustav Vasa?",
            model = "gpt-3.5-turbo")

# Test the API with specific arguments:
openai_chat("Who is Gustav Vasa?",
            model = "gpt-3.5-turbo",
            chat_args = list(temperature = 0))
openai_chat("Who is Gustav Vasa?",
             model = "gpt-3.5-turbo",
             chat_args = list(seed = 4711))

# For a more complex task:
messages <-
  list(list(role = "system",
            content = "You are a historian that is very formal and
                       answer with a short reply.
                       End the reply with the sentence:
                       'And so says the books'."),
       list(role = "user",
            content = "Who is Gustav Vasa?"))
openai_chat(messages, model = "gpt-3.5-turbo")
}

}
