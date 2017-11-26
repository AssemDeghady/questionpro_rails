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

    it "Can get survey data" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      survey = api_request.get_survey

      expect(survey.id).to eq(@test_survey_id)
    end

    it "Can get list of all surveys" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)      
      surveys = api_request.list_surveys

      expect(api_request.status["id"]).to eq(200)      
    end

    it "Can get survey response count" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      survey_response_count = api_request.get_survey_response_count

      expect(survey_response_count.id).to eq(@test_survey_id)
    end

  end

end
