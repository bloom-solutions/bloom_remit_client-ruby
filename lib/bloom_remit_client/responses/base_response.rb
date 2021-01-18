module BloomRemitClient
  class BaseResponse

    include APIClientBase::Response.module

    attribute :body, String, lazy: true, default: :default_body
    attribute :parsed_body, String, lazy: true, default: :default_parsed_body

    def default_body
      raw_response.body
    end

    def default_parsed_body
      JSON.parse(body).with_indifferent_access
    end

  end
end
