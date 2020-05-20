require_relative './errors'

module Southwest
  class Request
    protected

    def make_request(path, params, content_type)
      Typhoeus::Request.get("#{base_uri}#{path}", {
        proxy: ENV["FIXIE_URL"],
        params: params, headers: headers(content_type)
      })
    end

    def headers(content_type)
      {
        'User-Agent' => user_agent,
        'Content-Type' => content_type,
        'X-Api-Key' => api_key,
        'Accept-Language' => 'en-US;q=1'
      }
    end

    def base_uri
      # 'https://api-extensions.southwest.com/v1/mobile'
      'https://api-extensions.southwest.com/v1/mobile'
    end

    def user_agent
      "Southwest/7.5.0 (iPhone; iOS 13.4; Scale/2.00)"
    end

    def api_key
      # "l7xx8d8bfce4ee874269bedc02832674129b"
      # 'l7xx12ebcbc825eb480faa276e7f192d98d1'
      'l7xx0a43088fe6254712b10787646d1b298e'
    end
  end
end
