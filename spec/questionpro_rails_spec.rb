RSpec.describe QuestionproRails do

  describe "Default Attributes" do

    it "Has a version number" do
      expect(QuestionproRails::VERSION).not_to be nil
    end

    it "Has an Api key" do
      expect(QuestionproRails.api_key).not_to be nil
    end  
    
  end
  
end
