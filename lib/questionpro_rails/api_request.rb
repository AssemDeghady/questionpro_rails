require "questionpro_rails/survey"
require "questionpro_rails/account"
require "questionpro_rails/email_list"
require "questionpro_rails/email_template"
require "questionpro_rails/survey_response"
require "questionpro_rails/survey_response_count"

module QuestionproRails
  class ApiRequest
    include HTTParty
    format :json
    base_uri 'www.questionpro.com'

    attr_accessor :survey_id, :response_id, :result_mode, :start_date, :end_date, :starting_response_counter, 
                  :email_group_id, :template_id, :user_id,:status, :full_response, :success

    def initialize(survey_id = nil, response_id = nil, result_mode = 0, start_date = nil, end_date = nil, starting_response_counter = nil, email_group_id = nil, template_id = nil, user_id = nil)
      @survey_id = survey_id
      @response_id = response_id
      @result_mode = result_mode
      @start_date = start_date
      @end_date = end_date
      @starting_response_counter = starting_response_counter   
      @email_group_id = email_group_id   
      @template_id = template_id
      @user_id = user_id
    end

    def self.base_path(method_url)
      "/a/api/#{method_url}?apiKey=#{QuestionproRails.api_key}"
    end

    def options
      {id: self.survey_id, surveyID: self.survey_id, responseID: self.response_id, resultMode: self.result_mode, startDate: self.start_date, 
       endDate: self.end_date, startingResponseCounter: self.starting_response_counter,
       emailGroupID: self.email_group_id, templateID: self.template_id, userID: self.user_id}.compact.to_json
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

    def get_email_lists
      url = ApiRequest.base_path("questionpro.survey.getEmailLists")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      email_lists = []
      result_email_lists = result['response']['emailLists']
      result_email_lists.each do |email_list|
        email_lists.push(EmailList.new(email_list))
      end
      
      return email_lists
    end

    def get_email_list
      url = ApiRequest.base_path("questionpro.survey.getEmailList")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      email_list = EmailList.new(result['response']['emailList'])
      
      return email_list
    end 

    def delete_email_list
      url = ApiRequest.base_path("questionpro.survey.deleteEmailList")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      self.success = result['response']['success']

      return self
    end

    def get_email_templates
      url = ApiRequest.base_path("questionpro.survey.getEmailTemplates")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      email_templates = []
      result_email_templates = result['response']['emailTemplates']
      result_email_templates.each do |email_template|
        email_templates.push(EmailTemplate.new(email_template))
      end
      
      return email_templates
    end

    def get_email_template
      url = ApiRequest.base_path("questionpro.survey.getEmailTemplate")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      email_template = EmailTemplate.new(result['response']['emailTemplate'])
      
      return email_template
    end 

    def get_email_template
      url = ApiRequest.base_path("questionpro.survey.deleteEmailTemplate")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      self.success = result['response']['success']

      return self
    end

    def get_all_accounts
      url = ApiRequest.base_path("questionpro.survey.getAllAccounts")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      accounts = []
      result_accounts = result['response']['accounts']
      result_accounts.each do |account|
        accounts.push(Account.new(account))
      end
      
      return accounts
    end

    def get_account
      url = ApiRequest.base_path("questionpro.survey.getAccount")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      account = Account.new(result['response']['account'])
      
      return account
    end    
  end
end
