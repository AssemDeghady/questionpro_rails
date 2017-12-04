# QuestionproRails

This is an Api Wrapper for [Questionpro's api](https://www.questionpro.com/api/).

Makes api calls to Questionpro running simple methods and Converts the Json response to ruby object class

## Installation

Add this line to your Gemfile:

```ruby
gem 'questionpro_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install questionpro_rails

## Usage

First make an initializer `questionpro_rails.rb` inside `config/initializers` and add the configurations

```ruby
QuestionproRails.configure do |config|
  config.api_key = "xxxxxx-xxxxxxxxx-xxxxxx-xxxxxxxxxx"
end
```

Then you can create the ApiRequest object

```ruby
api_request = QuestionproRails::ApiRequest.new ()
```

Then add the necessary call parameters to that object, and run any of these methods

```ruby
# Get all the surveys.
surveys = api_request.list_surveys

# Get a specific survey.
api_request.survey_id = 123456
survey = api_request.get_survey

# Delete a specific survey.
# Sets api_request.success to 1 if successfull.
api_request.survey_id = 123456
api_request.delete_survey

# Get list of survey responses.
api_request.survey_id = 123456
survey_responses = api_request.get_survey_responses

# Get a specific survey response.
api_request.survey_id = 123456
api_request.response_id = 123456
survey_response = api_request.get_survey_reponse

# Get a specific survey response statistics.
api_request.survey_id = 123456
survey_response_count = api_request.get_survey_response_count

# Delete a specific survey response.
# Sets api_request.success to 1 if successfull.
api_request.survey_id = 123456
api_request.response_id = 123456
api_request.delete_response

# Get Email Lists related to a specific survey.
api_request.survey_id = 123456
email_lists = api_request.get_email_lists

# Get Specific Email List.
api_request.email_group_id = 123456
email_list = api_request.get_email_list

# Delete Specific Email List.
# Sets api_request.success to 1 if successfull.
api_request.email_group_id = 123456
api_request.delete_email_list

# Get Templates related to a specific survey.
api_request.survey_id = 123456
email_templates = api_request.get_email_templates

# Get Specific Template.
api_request.template_id = 123456
email_template = api_request.get_email_template

# Delete Specific Template.
# Sets api_request.success to 1 if successfull.
api_request.template_id = 123456
api_request.delete_email_template

# Get all the accounts.
accounts = api_request.get_all_accounts

# Get Specific Account.
api_request.user_id = 123456
account = api_request.get_account

# Get All Unsubscribed Emails
unsubscribed_emails = api_request.get_unsubscribers

# Get a specific survey meta.
api_request.survey_id = 123456
survey_send_meta = api_request.get_survey_meta

# Send Specific Survey.
# sets api_request.message to "Message successful.".
api_request.survey_id = 123456
api_request.email_group_id = 123456
api_request.template_id = 123456
api_request.send_survey(1, ["test@test.com"], 12345)

# Get Send History related to a specific survey.
api_request.survey_id = 123456
email_batches = api_request.get_send_history

# Send Reminders.
# sets api_request.message to "Message successful.".
api_request.survey_id = 123456
api_request.email_group_id = 123456
api_request.template_id = 123456
api_request.send_reminders

# Create Email List.
# Sets api_request email_group_id to the created email list id.
api_request.create_email_list(["test@test.com", "test2@test.com"], "test group name")
```

## Dependencies

| Tool          																					| Description           																						|
| ------------------------------------------------------- | ----------------------------------------------------------------- |
| [httparty](https://github.com/jnunemaker/httparty)      | used to make the call requests and extracting the response 			  |

## Contributing

1. Fork it.

2. Create your feature branch (`git checkout -b my-new-feature`)

3. Commit your changes (`git commit -am 'Add some feature'`)

4. Push to the branch (`git push origin my-new-feature`)

5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
