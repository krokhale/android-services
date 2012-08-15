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
          handle_response
        end

        private

        def validating options
          raise AndroidServices::Exceptions::RegistrationIdBlank.new("Atleast one registration id required to send message.") if options[:registration_ids].nil?
          raise AndroidServices::Exceptions::RegistrationIdLimit.new("You cannot define more than 1000 registration ids.") if options[:registration_ids].size > 1000
        end
        
        def build_request
          instance_variable_set("@#{request}", AndroidServices::GoogleCloudMessaging::Request.create(instance_variables))
        end
        
        def post_request!
          response_object = @request.post!
          instance_variable_set("@#{response}", response_object)
        end  
        
        def handle_response
          
        end

      end
    end
end