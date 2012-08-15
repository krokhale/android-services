module AndroidServices
  module GoogleCloudMessaging
    class Request
      
      def initialize message
        @message ||= message
      end
      
      private
      
      def post!
        uri = URI(AndroidServices.configuration.messaging_endpoint)
        response = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
          req = Net::HTTP::Post.new(uri.path)
          req.content_type = 'application/json'
          req["Authorization"] = 'key=AIzaSyBf7qptM9GaM4rAL-oH2vgM82liIZzFvmM' 
          http.request(req)
        end
        handle response
      end
      
      def handle
      end
      
      define_method(:cloud_message) { @message }
    end
  end
end