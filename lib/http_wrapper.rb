# This module is a wrapper over standard HTTP calls.
module HttpWrapper
  def self.get(url, headers = {})
    http, request = request(url)
    headers.each do |key, value|
      request[key] = value
    end
    response = http.request(request)
    parse_response(response)
  end

  def self.parse_response(response)
    [response.code.to_i, (response.content_type == 'application/json' ? JSON.parse(response.body) : nil)]
  end

  def self.request(url, type = :get)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if url.starts_with?('https')
    request = case type
              when :get
                Net::HTTP::Get.new(uri.request_uri)
              when :post
                Net::HTTP::Post.new(uri.request_uri)
              else
                raise Errors::InvalidOperation, 'HTTP methods outside GET and POST are not yet supported!'
              end
    [http, request]
  end
end
