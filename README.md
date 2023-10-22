# `orbai`: A Ruby DSL for OpenAI

Welcome to `orbai`, an idiomatic Ruby DSL for OpenAI's powerful API. With the
combination of Ruby's natural language processing strengths and OpenAI's
advanced capabilities, your applications are set to take a massive leap forward.

## Disclaimer

Please be aware that `orbai` is in its early stages and is not maintained
regularly. While we aim to provide the best, there might be bugs or
unimplemented features. Your patience and contributions are highly appreciated.

## Quick Start (For Rubyists)

1. Install the orbai gem:

```sh
gem install orbai
```

1. [Have an OpenAI API key](https://beta.openai.com/account/api-keys) in your
   environment. By default, `orbai` will look for `OPENAI_API_KEY`..

1. Use `orbai` to query OpenAI:

```ruby
require "orbai"

Orbai.query("What's the capital of France?")

# => "The capital of France is Paris."
```

## Rationale

1. **Ruby is the Best Language for DSLs**: Ruby's expressiveness has made it the
   go-to language for Domain Specific Languages, finding its use in a myriad of
   practical domains.
2. **OpenAI & Ruby**: OpenAI offers transformative capabilities to the domains
   where Ruby DSLs excel.
3. **orbai**: Born out of the need for an expressive, easy-to-integrate tool
   that merges the power of OpenAI and the elegance of Ruby.

## Getting Started (For Newbies)

1. Installing Ruby: If you're a technical person, we recommend using
   [asdf-vm](https://github.com/asdf-vm/asdf) for version management.
1. Learning Ruby: If you're new to Ruby... `TODO`
1. Follow the "Quick Start" guide above to get up and running.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

We welcome contributions to `orbai`! If you stumble upon issues or have features
you'd like to suggest, please:

- [Submit an issue](https://github.com/skotchpine/orbai/issues)
- For direct contributions,
  [submit a pull request](https://github.com/skotchpine/orbai/pulls).

## Help Wanted!

- 🔲 Feedback
- 🔲 Docs
- 🔲 Tests
- 🔲 Triage
- 🔲 Imagination

## `Orbai::DSL`

### Simple Query API

```ruby
require "orbai"
Orbai.query("What is your favorite color?")
#=> "My favorite color is blue."
```

### Wishlist

- 🔲 Config DX
- 🔲 Roles Builder DX
- 🔲 Context Params DX
- 🔲 Extract structured data
- 🔲 Functions DX
- 🔲 Images DX
- 🔲 Audio DX
- 🔲 Files DX
- 🔲 Embeddings DX
- 🔲 Fine-tuning DX

## `Orbai` Module / `HttpClient` HTTP Methods

The `Orbai` module is just a container for everything else.

For ease of use, it includes http getters through an `HttpClient` singleton.

The HTTP getters throw an `Orbai::HTTPClient::Error` if the request fails. The
OpenAI API `type` field from the error response is assigned to
`Orbai::HTTPClient::Error#type`.

### Example

```ruby
Orbai.get("/chat/completions", model: 'gpt-3.5-turbo', messages: [
  {role:'system',content:'Act as a helpful prompt.'},
  {role:'user',content:'What is the capital of France?'},
])

# Returns
{"id"=>"chatcmpl-XXXXXXXX",
 "object"=>"chat.completion",
 "created"=>1697444538,
 "model"=>"gpt-3.5-turbo-0613",
 "choices"=>
  [{"index"=>0,
    "message"=>
     {"role"=>"assistant", "content"=>"The capital of France is Paris."},
    "finish_reason"=>"stop"}],
 "usage"=>{"prompt_tokens"=>24, "completion_tokens"=>7, "total_tokens"=>31}}
```

### `Orbai` Shortcuts / `HttpClient` HTTP Methods

```ruby
c = Orbai::HttpClient.new

# HttpClient singleton
c.http_client #=> #<Orbai::HttpClient>

# HTTP Methods
c.get(path, **params) #=> Returns JSON result as a ruby hash.
c.post(path, **params)
c.put(path, **params)
c.patch(path, **params)
c.delete(path, **params)
c.http_request(method, path, **params)
```

## `Orbai::HttpClient`

The `HttpClient` class is used to make requests to the OpenAI API. It returns
the JSON response from the API as a ruby hash.

### Example:

```ruby
c = Orbai::HttpClient.new

c.chat_completions(
  model: 'gpt-3.5-turbo',
  messages: [
    {role:'system',content:'Act as a helpful prompt.'},
    {role:'user',content:'What is the capital of France?'},
  ],
)

# Returns
{"id"=>"chatcmpl-XXXXXXXX",
 "object"=>"chat.completion",
 "created"=>1697983333,
 "model"=>"gpt-3.5-turbo-0613",
 "choices"=>
  [{"index"=>0,
    "message"=>
     {"role"=>"assistant", "content"=>"The capital of France is Paris."},
    "finish_reason"=>"stop"}],
 "usage"=>{"prompt_tokens"=>24, "completion_tokens"=>7, "total_tokens"=>31}}
```

### API Methods Cheatsheet

```ruby
c = Orbai::HttpClient.new

# Chat
#   POST /chat/completions
c.chat_completions(**params)

# Completions
#   POST /completions
c.completions(**params)

# Edits
#   POST /edits
c.edits(**params)

# Images
#   POST /images/generations
c.create_image(**params)
#   POST /images/edits
c.create_image_edit(**params)
#   POST /images/variations
c.create_image_variation(**params)

# Embeddings
#   POST /embeddings
c.create_embedding(**params)

# Fine_tuning
#
#   POST /fine_tuning/jobs
c.create_fine_tuning_jobs(**params)
#   GET /fine_tuning/jobs
c.list_fine_tuning_jobs(**params)
#   GET /fine_tuning/jobs/{fine_tuning_job_id}
c.retrieve_fine_tuning_job(id, **params)
#   POST /fine_tuning/jobs/{fine_tuning_job_id}/cancel
c.cancel_fine_tuning_job(id, **params)
#   GET /fine_tuning/jobs/{fine_tuning_job_id}/events
c.list_fine_tuning_events(id, **params)

# Audio
#   POST /audio/transcriptions
c.create_transcription(**params)
#   POST /audio/translations
c.create_translation(**params)

# Files
#   GET /files
c.list_files(**params)
#   POST /files
c.upload_file(**params)
#   DELETE /files/{file_id}
c.delete_file(id, **params)
#   GET /files/{file_id}
c.retrieve_file(id, **params)
#   GET /files/{file_id}/content
c.file_content(id, **params)

# Models
#   GET /models
c.list_models(**params)
#   GET /models/{model}
c.retrieve_model(id, **params)
#   DELETE /models/{model}
c.delete_model(id, **params)

# Moderations
#   POST /moderations
c.create_moderation(**params)
```
