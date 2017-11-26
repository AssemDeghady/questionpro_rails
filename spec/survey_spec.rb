RSpec.describe QuestionproRails::Survey do

  describe "Survey Methods" do
    
    it "Can get survey sections" do
      api_request = QuestionproRails::ApiRequest.new(5898743)
      survey = api_request.get_survey
      sections = survey.sections

      expect(sections.count).to be
    end

  end

end
