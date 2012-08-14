module AndroidServices
  class Configuration
    OPTIONS = [:api_key, :messaging_endpoint].freeze
    attr_accessor :api_key
    
    def initialize
      @messaging_endpoint = "https://android.googleapis.com/gcm/send"
    end
    
  end
end