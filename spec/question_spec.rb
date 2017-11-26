RSpec.describe QuestionproRails::Question do

  describe "Question Methods" do
    
    it "Can get question choices" do
      api_request = QuestionproRails::ApiRequest.new(5898743)
      survey = api_request.get_survey
      section = survey.sections.first
      question = section.questions.first
      choices = question.choices

      expect(choices.count).to be
    end

  end

end
