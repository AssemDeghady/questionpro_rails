RSpec.describe QuestionproRails::ResponseSet do

  describe "Response Set Methods" do
    
    it "Can get Survey Answers" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      survey_responses = api_request.get_survey_responses
      survey_response = survey_responses.first
      response_set = survey_response.response_set.first
      answers = response_set.answers

      expect(answers.count).to be
    end

  end

end
