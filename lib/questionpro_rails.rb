require 'httparty'
require "questionpro_rails/configuration"
require "questionpro_rails/version"

module QuestionproRails
  include HTTParty
  format :json

  base_uri 'www.questionpro.com'

  attr_accessor :surveys, :status

  def initialize(response)
    @surveys = response['response']['surveys']
    @status = response['response']['status']
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.api_key
    QuestionproRails.configuration.api_key
  end

  def self.base_path(method_name)
    "/a/api/#{method_name}&api_key=#{ QuestionproRails.api_key }"
  end

  def self.surveys(options = {})
    url = "#{ QuestionproRails.base_path('questionpro.survey.getAllSurveys') }"
    response = get(url)
    if response.success?
      new(response)
    else
      raise response.response
    end        
  end  

end

# QuestionproRails.configure do |config|
#   config.api_key = "0f00a8a8-fa4e-4d1d-ac47-bdde52a95944"
# end
