RSpec.describe QuestionproRails::SurveyMeta do

  describe "Survey Meta Methods" do
    
    it "Can get email groups" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      survey_meta = api_request.get_survey_meta
      email_groups = survey_meta.email_groups

      expect(email_groups.count).to be
    end

    it "Can get templates" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      survey_meta = api_request.get_survey_meta
      templates = survey_meta.templates

      expect(templates.count).to be
    end    

  end

end
