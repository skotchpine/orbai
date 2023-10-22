# frozen_string_literal: true

require 'httparty'

require_relative "orbai/version"
require_relative "orbai/http_client"
require_relative "orbai/openai_methods"
require_relative "orbai/simple_methods"
require_relative "orbai/dsl"

module Orbai
  # Better experience for API errors
  class << self
    extend Forwardable

    # Singleton client for method delegation
    def http_client = @http_client ||= HttpClient.new

    def_delegators :http_client,
      :get, :post, :put, :patch, :delete, :http_request
  end
end
