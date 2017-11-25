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

  config.before(:all) do
    QuestionproRails.configure do |config|
      config.api_key = "0f00a8a8-fa4e-4d1d-ac47-bdde52a95944"
    end
  end  
end