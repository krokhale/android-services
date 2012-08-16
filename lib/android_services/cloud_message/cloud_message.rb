module AndroidServices
  module GoogleCloudMessaging
    class CloudMessage
      attr_accessor :options


      def initialize(options)
        validating options
        [ :registration_ids,
          :dry_run,
          :collapse_key,
          :data,
          :delay_while_idle,
          :time_to_live].each do |option|
            instance_variable_set("@#{option}", options[option])
          end
        end

        def send!
          build_request
          post_request!
        end
        

        private

        def validating options
          raise AndroidServices::Exceptions::RegistrationIdBlank.new("Atleast one registration id required to send message.") if options[:registration_ids].nil?
          raise AndroidServices::Exceptions::RegistrationIdLimit.new("You cannot define more than 1000 registration ids.") if options[:registration_ids].size > 1000
        end
        
        def build_request
          instance_variable_set("@request", AndroidServices::GoogleCloudMessaging::Request.new(payload))
          self.class.instance_eval do
            define_method(:request) { @request }
          end
        end
        
        def payload
          params = instance_variables_hash.select {|k,v| ["registration_ids", "dry_run", "collapse_key", "data", "delay_while_idle", "time_to_live"].include?(k) && !v.nil?}
          params.to_json
        end
        
        def post_request!
          response_object = @request.send :post!
          instance_variable_set("@response", response_object)
          self.class.instance_eval do
            define_method(:response) { @request }
          end
          @response
        end  
        
        def instance_variables_hash
          Hash[instance_variables.map { |name| [name.to_s.gsub("@",""), instance_variable_get(name)] } ]
        end

      end
    end
end