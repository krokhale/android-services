module AndroidServices
  module GoogleCloudMessaging
    class Request
      
      def initialize payload
        @payload ||= payload
      end
      
      private
      
      def post!
        handle post_to uri
      end
      
      def handle response
        AndroidServices::GoogleCloudMessaging::Response.new(response)
      end
      
      def uri
        URI(AndroidServices.configuration.messaging_endpoint)
      end
      
      def post_to uri
        Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            req = Net::HTTP::Post.new(uri.path)
            req.body =  @payload
            req['Content-Type'] = AndroidServices.configuration.content_type
            req["Authorization"] = "key=#{AndroidServices.configuration.api_key}"
            http.request(req)
        end
      end
      
    end
  end
end