require "questionpro_rails/survey"
require "questionpro_rails/survey_response_count"

module QuestionproRails
  class ApiRequest
    include HTTParty
    format :json
    base_uri 'www.questionpro.com'

    attr_accessor :id, :result_mode, :start_date, :end_date, :starting_response_counter, :status

    def initialize(id, result_mode = 0, start_date = nil, end_date = nil, starting_response_counter = nil)
      @id = id
      @result_mode = result_mode
      @start_date = start_date
      @end_date = end_date
      @starting_response_counter = starting_response_counter      
    end

    def self.base_path(method_url)
      "/a/api/#{method_url}?apiKey=#{QuestionproRails.api_key}"
    end

    def options
      {id: self.id, resultMode: self.result_mode, startDate: self.start_date, 
       endDate: self.end_date, startingResponseCounter: self.starting_response_counter}.compact.to_json
    end

    def list_surveys
      url = ApiRequest.base_path("questionpro.survey.getAllSurveys")
      result = self.class.get(url, body: self.options)
      
      self.status = result['status']
      surveys = result['response']

      return surveys
    end

    def get_survey
      url = ApiRequest.base_path("questionpro.survey.getSurvey")
      result = self.class.get(url, body: self.options)
      
      self.status = result['status']
      survey = result['response']

      return survey
    end

    def get_survey_response_count
      url = ApiRequest.base_path("questionpro.survey.responseCount")
      result = self.class.get(url, body: self.options)
      
      self.status = result['status']
      response_count = SurveyResponseCount.new(result['response'])

      return response_count
    end
  end
end