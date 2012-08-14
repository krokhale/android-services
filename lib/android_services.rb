$:.unshift(File.dirname(__FILE__))

# require 'services/messaging'
require 'android_services/configuration'


module AndroidServices

  class << self
    attr_writer :configuration
    
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
    
  end

end