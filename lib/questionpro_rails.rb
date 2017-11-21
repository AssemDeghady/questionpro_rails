require 'httparty'
require "questionpro_rails/configuration"
require "questionpro_rails/version"

module QuestionproRails
  include HTTParty
  base_uri 'www.questionpro.com'

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

  def base_path(method_name)
    "/a/api/#{method_name}&api_key=#{ self.configure.api_key }"
  end

  def surveys(options = {})
    url = "#{ base_path('questionpro.survey.getAllSurveys') }"
    self.class.get(url, options)['response']['surveys']
  end  

end
