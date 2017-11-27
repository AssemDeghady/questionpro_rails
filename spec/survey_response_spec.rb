RSpec.describe QuestionproRails::SurveyResponse do

  describe "Survey Response Methods" do
    
    it "Can get Resonse Sets" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      survey_responses = api_request.get_survey_responses
      survey_response = survey_responses.first
      response_set = survey_response.response_set

      expect(response_set.count).to be
    end

  end

end
