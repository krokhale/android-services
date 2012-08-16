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
        puts response.body
        instance_variable_set("@response", response)
        self.class.instance_eval do
          define_method(:response) { @response }
        end
      end
      
      def uri
        URI(AndroidServices.configuration.messaging_endpoint)
      end
      
      def post_to uri
          puts uri
          puts @payload
          Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            req = Net::HTTP::Post.new(uri.path)
            req.body =  @payload
            req['Content-Type'] = 'application/json'
            req["Authorization"] = 'key=AIzaSyBf7qptM9GaM4rAL-oH2vgM82liIZzFvmM' 
            http.request(req)
          end
      end
      
    end
  end
end