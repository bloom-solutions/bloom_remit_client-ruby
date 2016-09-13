# frozen_string_literal: true
module BloomRemitClient
  module Requests
    PATH_PARAM_REGEX = /\:[^\/|\?|\#|$]*/
    GET = 'get'
    POST = 'post'
    PUT = 'put'
    DELETE = 'delete'
    REQUEST_TYPES = [GET, POST, PUT, DELETE].freeze
    CONTENT_TYPE_JSON_UTF8 = 'application/json;charset=UTF-8'
    CONTENT_TYPE_JSON = 'application/json'

    def self.normalize_path(path, params, postfix = nil)
      normalized_path = path.gsub(PATH_PARAM_REGEX) { |e| params[e.delete(':').to_sym] }
      postfix ? "#{normalized_path}/#{postfix}" : normalized_path
    end
  end
end
