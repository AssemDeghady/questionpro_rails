require 'httparty'
require "questionpro_rails/configuration"
require "questionpro_rails/version"
require "questionpro_rails/api_request"

module QuestionproRails
  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield(configuration)
    end    

    def api_key
      configuration.api_key
    end
  end

  # def self.surveys(options = {})
  #   url = "#{ QuestionproRails.base_path('questionpro.survey.getAllSurveys') }"
  #   response = get(url)
  #   if response.success?
  #     new(response)
  #   else
  #     raise response.response
  #   end        
  # end  

end