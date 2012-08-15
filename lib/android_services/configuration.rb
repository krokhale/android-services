module AndroidServices
  class Configuration
    OPTIONS = [:api_key, :messaging_endpoint, :secure, :port, :protocol].freeze
    attr_accessor :api_key
    
    attr_accessor :messaging_endpoint
    
    attr_accessor :secure
    
    attr_accessor :port
    
    alias_method :secure?, :secure
    
    def initialize
      @secure = true
      @messaging_endpoint = "#{protocol}://android.googleapis.com/gcm/send"
      @content_type = 'application/json'
    end
    
    def port
      @port || default_port
    end
    
    def protocol
      if secure?
        'https'
      else
        'http'
      end
    end
    
    private
    
    def default_port
      if secure?
        443
      else
        80
      end
    end
    
  end
end