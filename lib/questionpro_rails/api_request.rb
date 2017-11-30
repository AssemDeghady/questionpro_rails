require "questionpro_rails/survey"
require "questionpro_rails/account"
require "questionpro_rails/email_list"
require "questionpro_rails/email_template"
require "questionpro_rails/email_batch"
require "questionpro_rails/survey_meta"
require "questionpro_rails/survey_response"
require "questionpro_rails/survey_response_count"
require "questionpro_rails/unsubscribed_email"

module QuestionproRails
  class ApiRequest
    include HTTParty
    format :json
    base_uri 'www.questionpro.com'

    attr_accessor :survey_id, :response_id, :result_mode, :start_date, :end_date, 
                  :success, :message, :user_id, :status, :full_response, 
                  :starting_response_counter,  :email_group_id, :template_id

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
      {id: self.survey_id, surveyID: self.survey_id, responseID: self.response_id, 
       resultMode: self.result_mode, startDate: self.start_date, userID: self.user_id, 
       endDate: self.end_date, startingResponseCounter: self.starting_response_counter, 
       emailGroupID: self.email_group_id, templateID: self.template_id}.compact.to_json
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

    def delete_email_template
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

    def get_unsubscribers
      url = ApiRequest.base_path("questionpro.survey.getUnsubscribedEmailAddresses")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      unsubscribers = []
      result_unsubscribers = result['response']['response']
      result_unsubscribers.each do |unsubscriber|
        unsubscribers.push(UnsubscribedEmail.new(unsubscriber))
      end
      
      return unsubscribers
    end

    def get_survey_meta
      url = ApiRequest.base_path("questionpro.survey.sendSurveyMetaData")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      survey_meta = SurveyMeta.new(result['response'])
      
      return survey_meta          
    end

    def send_survey(mode = 1, emails = nil, template = nil)
      url = ApiRequest.base_path("questionpro.survey.sendSurvey")
      result = self.class.get(url, body: {surveyID: self.survey_id, mode: mode, 
                                          emailGroupID: self.email_group_id, emails: emails, 
                                          templateID: self.template_id, template: template}.compact.to_json)

      self.full_response = result
      self.status = result['status']
      self.message = result['response']['result']
    end

    def get_send_history
      url = ApiRequest.base_path("questionpro.survey.emailBatchStatistics")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']

      email_batches = []
      result_email_batches = result['response']['emailBatches']
      result_email_batches.each do |email_batch|
        email_batches.push(EmailBatch.new(email_batch))
      end
      
      return email_batches      
    end

    def send_reminders
      url = ApiRequest.base_path("questionpro.survey.sendReminder")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      self.message = result['response']['result']
    end  

    def create_email_list (emails = [], email_group_name = nil)
      url = ApiRequest.base_path("questionpro.survey.createEmailGroup")
      result = self.class.get(url, body: {id: self.survey_id, emails: emails, 
                                          emailGroupName: email_group_name}.compact.to_json)

      self.full_response = result
      self.status = result['status']

      unless result['response']['result']['emailGroupID'].nil?
        self.email_group_id = result['response']['result']['emailGroupID']
      end
    end 
  end
end
