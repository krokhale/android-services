$:.unshift(File.dirname(__FILE__))

require 'net/http'

require 'android_services/cloud_message/cloud_message'
require 'android_services/cloud_message/request'
require 'android_services/cloud_message/response'

require 'android_services/configuration'
require 'android_services/exceptions'


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