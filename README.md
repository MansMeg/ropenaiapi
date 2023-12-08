# ropenaiapi
An R package to work with the Open AI API.

## Installation

To install the R package, just use run:
```
library(remotes)
remotes::install_github('MansMeg/ropenaiapi')
```

## Use 

To use the API you need an API key/token and a user account at Open AI. You then can just load the package as:
```
library(ropenaiapi)
```

### Chat

To do an API call to the Open AI chat interface we first need to set the API key as:
```
> set_openai_api_key("[YOUR KEY GOES HERE]")
```

Now we can do calls to the API as:
```
> x <- openai_chat("Who is Gustav Vasa? Give a short answer.")
> x
assistant:
Gustav Vasa was a Swedish king who led a successful rebellion against Danish rule and became the founder of modern Sweden in the 16th century.
```

To set additional API arguments, use `chat_args`:

```
> x <- openai_chat("Who is Gustav Vasa? Give a short answer.", 
                   chat_args = list(temperature = 0.1))
> x
assistant:
Gustav Vasa was a Swedish king who led the rebellion against Danish rule and established the Vasa dynasty, becoming the first monarch of modern Sweden in the 16th century.
```

Finally, we can also set the system initialization for the query as:

```
> messages <- list(list(role = "system", 
+                       content = "You are a historian that is very formal and 
+                                  answer with a short reply. 
+                                  End the reply with the sentence: 
+                                  'And so says the books'."),
+                  list(role = "user", 
+                       content = "Who is Gustav Vasa?"))
> x <- openai_chat(messages = messages)
> x
assistant:
Gustav Vasa was the founder of modern Sweden and the first monarch of the Vasa dynasty. And so says the books.
```
