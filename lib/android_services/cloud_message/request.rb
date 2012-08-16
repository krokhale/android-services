module AndroidServices
  module GoogleCloudMessaging
    class Request
      
      def initialize message
        @message ||= message
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
      
      def payload
        @message.send(:instance_variables_hash).select {|k,v| ["registration_ids", "dry_run", "collapse_key", "data", "delay_while_idle", "time_to_live"].include?(k) && !v.nil?}
      end
      
      def post_to uri
          puts uri
          puts payload.class
          Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            req = Net::HTTP::Post.new(uri.path)
            req.set_form_data payload
            req['Content-Type'] = 'application/json'
            req["Authorization"] = 'key=AIzaSyBf7qptM9GaM4rAL-oH2vgM82liIZzFvmM' 
            http.request(req)
          end
      end
      
      define_method(:cloud_message) { @message }
    end
  end
end