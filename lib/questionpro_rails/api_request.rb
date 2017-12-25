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

    # Initializes a new Api Request.
    #
    # @param survey_id [Integer] 
    # @param response_id [Integer] 
    # @param result_mode [Integer] 
    # @param start_date [String]  
    # @param end_date [String]
    # @param starting_response_counter [Integer] 
    # @param email_group_id [Integer]
    # @param template_id [Integer]
    # @param user_id [Integer]
    # @return [QuestionproRails::ApiRequest] Api Request object that is used to make the calls
    def initialize(survey_id = nil, response_id = nil, result_mode = 0, start_date = nil, end_date = nil, starting_response_counter = nil, email_group_id = nil, template_id = nil, user_id = nil)
      @survey_id                 = survey_id
      @response_id               = response_id
      @result_mode               = result_mode
      @start_date                = start_date
      @end_date                  = end_date
      @email_group_id            = email_group_id   
      @template_id               = template_id
      @user_id                   = user_id
      @starting_response_counter = starting_response_counter
    end

    # Get the base url for api call.
    # 
    # @param method_url [String] the api method url.
    # @return [String] Url for Api Call. 
    def self.base_path(method_url)
      "/a/api/#{method_url}?apiKey=#{QuestionproRails.api_key}"
    end

    # Transform the object to the acceptable json format by questionpro.
    # 
    # @return [Json] options in the call request.
    def options
      {id: self.survey_id, surveyID: self.survey_id, responseID: self.response_id, 
       resultMode: self.result_mode, startDate: self.start_date, userID: self.user_id, 
       endDate: self.end_date, startingResponseCounter: self.starting_response_counter, 
       emailGroupID: self.email_group_id, templateID: self.template_id}.compact.to_json
    end

    # Get all the surveys that belongs to the api key's owner.
    # 
    # @return [Array<QuestionproRails::Survey>] Surveys.
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

    # Get a specific survey.
    # Survey ID must be set inside the api request object.
    #
    # @return [QuestionproRails::Survey] Survey.
    def get_survey
      url = ApiRequest.base_path("questionpro.survey.getSurvey")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']

      survey = Survey.new(result['response'])

      return survey
    end

    # Delete a specific survey.
    # Survey ID must be set inside the api request object.
    #
    # @return sets ApiRequest success attribute to 1.
    def delete_survey
      url = ApiRequest.base_path("questionpro.survey.deleteSurvey")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']
      self.success = result['response']['success']

      return self
    end    

    # Get list of survey Responses.
    # Survey ID must be set inside the api request object.
    #
    # @return [Array<QuestionproRails::SurveyResponse>] Survey Responses.
    def get_survey_responses
      url = ApiRequest.base_path("questionpro.survey.surveyResponses")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      survey_responses = []
      result_responses = result['response']['responses']
      result_responses.each do |response|
        new_response = SurveyResponse.new(response)
        survey_responses.push(SurveyResponse.new(new_response))
      end
      
      return survey_responses
    end

    # Get a specific survey Response.
    # Survey ID must be set inside the api request object.
    # Response ID must be set inside the api request object.
    #
    # @return [QuestionproRails::SurveyResponse] Survey Response.
    def get_survey_reponse
      url = ApiRequest.base_path("questionpro.survey.surveyResponse")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']

      response = SurveyResponse.new(result['response']['surveyResponse'])

      return response
    end

    # Get a specific survey Response Statistics.
    # Survey ID must be set inside the api request object.
    #
    # @return [QuestionproRails::SurveyResponseCount] Survey Response Statistics.
    def get_survey_response_count
      url = ApiRequest.base_path("questionpro.survey.responseCount")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']

      response_count = SurveyResponseCount.new(result['response'])

      return response_count
    end   

    # Delete a specific survey response.
    # Survey ID must be set inside the api request object.
    # Response ID must be set inside the api request object.    
    #
    # @return sets ApiRequest success attribute to 1.
    def delete_response
      url = ApiRequest.base_path("questionpro.survey.deleteResponse")
      result = self.class.get(url, body: self.options)
      
      self.full_response = result
      self.status = result['status']
      self.success = result['response']['success']

      return self       
    end 

    # Get Email Lists related to a specific survey.
    # Survey ID must be set inside the api request object.
    #
    # @return [Array<QuestionproRails::EmailList>] Email Lists.
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

    # Get Specific Email List.
    # Email Group ID must be set inside the api request object.
    #
    # @return [QuestionproRails::EmailList] Email List.
    def get_email_list
      url = ApiRequest.base_path("questionpro.survey.getEmailList")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      email_list = EmailList.new(result['response']['emailList'])
      
      return email_list
    end 

    # Delete Specific Email List.
    # Email Group ID must be set inside the api request object.
    #
    # @return sets ApiRequest success attribute to 1.
    def delete_email_list
      url = ApiRequest.base_path("questionpro.survey.deleteEmailList")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      self.success = result['response']['success']

      return self
    end

    # Get Templates related to a specific survey.
    # Survey ID must be set inside the api request object.
    #
    # @return [Array<QuestionproRails::Template>] Templates.
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

    # Get Specific Template.
    # Template ID must be set inside the api request object.
    #
    # @return [QuestionproRails::Template] Template.
    def get_email_template
      url = ApiRequest.base_path("questionpro.survey.getEmailTemplate")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      email_template = EmailTemplate.new(result['response']['emailTemplate'])
      
      return email_template
    end 

    # Delete Specific Template.
    # Template ID must be set inside the api request object.
    #
    # @return sets ApiRequest success attribute to 1.
    def delete_email_template
      url = ApiRequest.base_path("questionpro.survey.deleteEmailTemplate")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      self.success = result['response']['success']

      return self
    end

    # Get all the accounts that belongs to the api key's owner.
    # 
    # @return [Array<QuestionproRails::Account>] Accounts.
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

    # Get Specific Account.
    # User ID must be set inside the api request object.
    #
    # @return [QuestionproRails::Account] Account.
    def get_account
      url = ApiRequest.base_path("questionpro.survey.getAccount")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      account = Account.new(result['response']['account'])
      
      return account
    end   

    # Get Unsubscribed Emails related to the api key.
    #
    # @return [Array<QuestionproRails::UnsubscribedEmail>] Unsubscribed Emails.
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

    # Survey ID must be set inside the api request object.
    #
    # @return [QuestionproRails::SurveyMeta] Survey meta.
    def get_survey_meta
      url = ApiRequest.base_path("questionpro.survey.sendSurveyMetaData")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      
      survey_meta = SurveyMeta.new(result['response'])
      
      return survey_meta          
    end

    # Send Specific Survey.
    # Survey ID must be set inside the api request object.
    #
    # @param [Integer] mode (1).
    # @param [Array<String>] emails to send to (nil).
    # @param [Integer] template_id of email (nil).
    # @return sets ApiRequest message attribute to "Message successful.".
    def send_survey(mode = 1, emails = nil, template_id = nil)
      url = ApiRequest.base_path("questionpro.survey.sendSurvey")
      result = self.class.get(url, body: {surveyID: self.survey_id, mode: mode, 
                                          emailGroupID: self.email_group_id, emails: emails, 
                                          templateID: self.template_id, template: template_id}.compact.to_json)

      self.full_response = result
      self.status = result['status']
      self.message = result['response']['result']
    end

    # Get Send History related to a specific survey.
    # Survey ID must be set inside the api request object.
    #
    # @return [Array<QuestionproRails::EmailBatch>] Email Batches.
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

    # Send Reminders.
    # Survey ID must be set inside the api request object.
    # Email Group ID must be set inside the api request object.
    # Template ID must be set inside the api request object.
    #
    # @return sets ApiRequest message attribute to "Message successful.".
    def send_reminders
      url = ApiRequest.base_path("questionpro.survey.sendReminder")
      result = self.class.get(url, body: self.options)

      self.full_response = result
      self.status = result['status']
      self.message = result['response']['result']
    end  

    # Create Email List.
    # Survey ID must be set inside the api request object.
    #
    # @param [Array<String>] emails ([]).
    # @param [String] email_group_name (nil).
    # @return sets ApiRequest email_group_id to the created email list id.
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
