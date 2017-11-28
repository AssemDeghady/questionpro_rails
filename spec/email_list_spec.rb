RSpec.describe QuestionproRails::EmailList do

  describe "Email List Methods" do
    
    it "Can get statistics" do
      api_request = QuestionproRails::ApiRequest.new()
      api_request.email_group_id = @test_email_group_id

      email_list = api_request.get_email_list
      statistics = email_list.statistics

      expect(statistics.count).to be
    end

    it "Can get array of emails" do
      api_request = QuestionproRails::ApiRequest.new()
      api_request.email_group_id = @test_email_group_id

      email_list = api_request.get_email_list
      emails = email_list.emails

      expect(emails.count).to be
    end    

  end

end
