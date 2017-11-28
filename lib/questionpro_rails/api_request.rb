require "questionpro_rails/survey"
require "questionpro_rails/survey_response"
require "questionpro_rails/survey_response_count"

module QuestionproRails
  class ApiRequest
    include HTTParty
    format :json
    base_uri 'www.questionpro.com'

    attr_accessor :id, :response_id,:result_mode, :start_date, :end_date, :starting_response_counter, 
                  :status, :full_response, :success

    def initialize(id, response_id = nil, result_mode = 0, start_date = nil, end_date = nil, starting_response_counter = nil)
      @id = id
      @response_id = response_id
      @result_mode = result_mode
      @start_date = start_date
      @end_date = end_date
      @starting_response_counter = starting_response_counter      
    end

    def self.base_path(method_url)
      "/a/api/#{method_url}?apiKey=#{QuestionproRails.api_key}"
    end

    def options
      {id: self.id, surveyID: self.id, responseID: self.response_id, resultMode: self.result_mode, startDate: self.start_date, 
       endDate: self.end_date, startingResponseCounter: self.starting_response_counter}.compact.to_json
    end

    def list_surveys
      url = ApiRequest.base_path("questionpro.survey.getAllSurveys")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']      
      
      surveys = []
      result_surveys = result['response']['surveys']
      result_surveys.each do |survey|
        surveys.push(Survey.new(survey))
      end     

      return surveys
    end

    def get_survey
      url = ApiRequest.base_path("questionpro.survey.getSurvey")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']

      survey = Survey.new(result['response'])

      return survey
    end

    def delete_survey
      url = ApiRequest.base_path("questionpro.survey.deleteSurvey")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']
      self.success = result['response']['success']

      return self
    end    

    def get_survey_responses
      url = ApiRequest.base_path("questionpro.survey.surveyResponses")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      survey_responses = []
      result_responses = result['response']['responses']
      result_responses.each do |response|
        survey_responses.push(SurveyResponse.new(response))
      end
      
      return survey_responses
    end

    def get_survey_reponse
      url = ApiRequest.base_path("questionpro.survey.surveyResponse")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']

      response = SurveyResponse.new(result['response']['surveyResponse'])

      return response
    end

    def get_survey_response_count
      url = ApiRequest.base_path("questionpro.survey.responseCount")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']

      response_count = SurveyResponseCount.new(result['response'])

      return response_count
    end   

    def delete_response
      url = ApiRequest.base_path("questionpro.survey.deleteResponse")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']
      self.success = result['response']['success']

      return self       
    end 
  end
end