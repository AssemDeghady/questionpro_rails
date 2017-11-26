RSpec.describe QuestionproRails::Section do

  describe "Section Methods" do
    
    it "Can get section questions" do
      api_request = QuestionproRails::ApiRequest.new(@test_survey_id)
      survey = api_request.get_survey
      section = survey.sections.first
      questions = section.questions

      expect(questions.count).to be
    end

  end

end
