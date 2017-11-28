require "bundler/setup"
require "questionpro_rails"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Change these to a working account with existing survey
  config.before(:all) do
    @test_survey_id = 5905994
    @test_user_id = 3889871
    @test_response_id = 15806007
    @test_email_group_id = 1300
    @test_email_template_id = 123

    QuestionproRails.configure do |config|
      config.api_key = "0f00a8a8-fa4e-4d1d-ac47-bdde52a95944"
    end
  end  
end