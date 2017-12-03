require 'httparty'
require "questionpro_rails/configuration"
require "questionpro_rails/version"
require "questionpro_rails/api_request"

module QuestionproRails

  class << self
    
    attr_accessor :configuration

    # Get the Configurations or Reset
    # 
    # @return [QuestionproRails::Configuration] Configuration
    def configuration
      @configuration ||= Configuration.new
    end

    # Reset Configuration to nil
    def reset
      @configuration = Configuration.new
    end

    # Holds the configurtion block
    def configure
      yield(configuration)
    end    

    # Get the api key from the configurations
    # 
    # @return [String] Api Key
    def api_key
      configuration.api_key
    end
  end

end