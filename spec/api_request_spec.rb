RSpec.describe QuestionproRails::ApiRequest do

  describe "Default Attributes" do
    
    it "Must include httparty methods" do
      QuestionproRails::ApiRequest.included_modules.include?(HTTParty)
    end

    it "Can get base path based on method url" do
      url = QuestionproRails::ApiRequest.base_path("questionpro.survey.getAllSurveys")

      expect(url).not_to be "/a/api/questionpro.survey.getAllSurveys?apiKey=#{QuestionproRails.api_key}"
    end

  end

  describe "Api Calls" do

    it "Can get list of all surveys" do
      api_request = QuestionproRails::ApiRequest.new()      
      surveys = api_request.list_surveys

      expect(api_request.status["id"]).to eq(200)      
    end    

    it "Can get survey data" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      survey = api_request.get_survey

      expect(survey.id).to eq(@test_survey_id)
    end

    it "Can delete specific survey" do
      api_request = QuestionproRails::ApiRequest.new(@test_delete_survey_id)
      request = api_request.delete_survey

      expect(request.success).to eq(1)
    end             

    it "Can get survey responses" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      survey_responses = api_request.get_survey_responses

      expect(api_request.status["id"]).to eq(200)      
    end   

    it "Can get specific survey response" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id, @test_response_id)
      survey_responses = api_request.get_survey_reponse

      expect(survey_responses.id).to eq(@test_response_id)
    end       

    it "Can get survey response count" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      survey_response_count = api_request.get_survey_response_count

      expect(survey_response_count.id).to eq(@test_survey_id)
    end 

    it "Can delete specific survey response" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id, @test_delete_response_id)
      request = api_request.delete_response

      expect(request.success).to eq(1)
    end  

    it "Can get email lists" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      email_lists = api_request.get_email_lists

      expect(api_request.status["id"]).to eq(200)      
    end   

    it "Can get specific email list" do
      api_request = QuestionproRails::ApiRequest.new()
      api_request.email_group_id = @test_email_group_id

      email_list = api_request.get_email_list

      expect(email_list.email_group_id).to eq(@test_email_group_id)
    end       

    it "Can delete specific email list" do
      api_request = QuestionproRails::ApiRequest.new()
      api_request.email_group_id = @test_delete_email_group_id

      request = api_request.delete_email_list

      expect(request.success).to eq(1)
    end  

    it "Can get email templates" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      email_templates = api_request.get_email_templates

      expect(api_request.status["id"]).to eq(200)      
    end   

    it "Can get specific email template" do
      api_request = QuestionproRails::ApiRequest.new()
      api_request.template_id = @test_email_template_id

      email_template = api_request.get_email_template

      expect(email_template.id).to eq(@test_email_template_id)
    end       

    it "Can delete specific email template" do
      api_request = QuestionproRails::ApiRequest.new()
      api_request.template_id = @test_delete_email_template_id

      request = api_request.delete_email_template

      expect(request.success).to eq(1)
    end

    it "Can get all accounts" do
      api_request = QuestionproRails::ApiRequest.new()
      accounts = api_request.get_all_accounts

      expect(api_request.status["id"]).to eq(200)      
    end   

    it "Can get specific account" do
      api_request = QuestionproRails::ApiRequest.new()
      api_request.user_id = @test_user_id

      account = api_request.get_account

      expect(account.id).to eq(@test_user_id)
    end 

    it "Can get all unsubscribers" do
      api_request = QuestionproRails::ApiRequest.new()
      unsubscribers = api_request.get_unsubscribers

      expect(api_request.status["id"]).to eq(200)      
    end                                  

    it "Can get survey meta" do
      api_request = QuestionproRails::ApiRequest.new(@test_user_id)
      survey_meta = api_request.get_survey_meta

      expect(api_request.status["id"]).to eq(200)         
    end

    it "Can get send survey" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      api_request.email_group_id = @test_email_group_id
      api_request.template_id = @test_email_template_id
      api_request.send_survey

      expect(api_request.status["id"]).to eq(200)
    end 

    it "Can get send history" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      email_batches = api_request.get_send_history

      expect(api_request.status["id"]).to eq(200)
    end       

    it "Can get send reminders" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      api_request.email_group_id = @test_email_group_id
      api_request.template_id = @test_email_template_id
      api_request.send_reminders

      expect(api_request.status["id"]).to eq(200)
    end 

    it "Can create email list" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      api_request.create_email_list(["assem.deghady@gmail.com"])

      expect(api_request.email_group_id).to_not be_nil
    end     
  end
end
