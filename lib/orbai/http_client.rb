module Orbai
  # Better experience for API interaction
  class HttpClient
    class Error < StandardError
      attr_reader :type
      def initialize(response)
        @type = response['type']
        super(response['message'])
      end
    end

    DEFAULT_OPS = {
      url: 'https://api.openai.com/v1',
      token: ENV['OPENAI_API_KEY'],
      default_prompt: 'Act as a ruby programmer introducing someone to the language.',
      default_model: 'gpt-3.5-turbo'
    }

    def initialize(**ops)
      @ops = DEFAULT_OPS.merge(ops)
    end

    # Send HTTP request to openAI's API
    #
    # NOTE: method must be lowercase
    #
    def http_request(method, path, multipart: false, **params)
      url = "#{@ops[:url]}#{path}"
      headers = {'Authorization' => "Bearer #{@ops[:token]}"}

      response = if multipart
        headers['Content-Type'] = 'multipart/form-data'
        HTTParty.send(method, url, multipart:, headers:, body: params)
      else
        headers['Content-Type'] = 'application/json'
        HTTParty.send(method, url, multipart:, headers:, body: params.to_json)
      end

      raise Error, response['error'] if response['error']

      response
    end

    # HTTP method helpers: get, post, put, patch, delete
    def get(path, **params) = http_request('get', path, **params)
    def post(path, **params) = http_request('post', path, **params)
    def put(path, **params) = http_request('put', path, **params)
    def patch(path, **params) = http_request('patch', path, **params)
    def delete(path, **params) = http_request('delete', path, **params)
  end
end
