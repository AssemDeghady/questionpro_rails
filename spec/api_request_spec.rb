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

    it "Can get survey response count" do
      api_request = QuestionproRails::ApiRequest.new(5898743)
      survey_response_count = api_request.get_survey_response_count

      expect(survey_response_count.id).to eq(5898743)
    end

  end

end
