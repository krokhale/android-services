$:.unshift(File.dirname(__FILE__))

# require 'services/messaging'
require 'android_services/configuration'


module AndroidServices

  class << self
    attr_writer :configuration
    
    # @example
    # AndroidServices.configure do |config|
    #   config.api_key = '1232fsd23asd'
    #   config.secure = true
    # end
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
    
  end

end