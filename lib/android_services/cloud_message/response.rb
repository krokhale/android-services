module AndroidServices
  module GoogleCloudMessaging
    class Response
      
      def initialize response
        unless response.body.nil?
          @body ||= response.body
          instantiate_attributes
        end
        @status ||= response.code
        eval_response
      end
      
      private
      
      def instantiate_attributes
        JSON.parse(@body).each do |attr, value|
          instance_variable_set("@#{attr}", value)
        end
        var_hash = instance_variables_hash
        self.class.instance_eval do
          var_hash.each do |var, value|
            define_method(var) { value }
          end
        end
      end
      
      def instance_variables_hash
        Hash[instance_variables.map { |name| [name.to_s.gsub("@",""), instance_variable_get(name)] } ]
      end
      
      def eval_response
        if @status.eql? 200
          true
        elsif @status.eql? 400
          "STATUS:400 Request could not be parsed as JSON."
        elsif @status.eql? 401
          "STATUS:401 There was an error authenticating the sender account."
        elsif @status.eql? 500
          "STATUS:500 There was an internal error in the GCM server while trying to process the request."
        elsif @status.eql? 500
          "STATUS:503 The GCM server took too long to process the request."
          # TODO Implement exponential backoff algorithm to retry sending.  
        end
      end
      
    end
  end
end