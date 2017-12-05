require "questionpro_rails/email_list_statistic"

module QuestionproRails
  class EmailList

    attr_reader :survey_id, :name, :email_group_id, 
                :unsubscribed, :total, :active, :pendin_verification, :bounced

    # @return [Array<String>] Emails.
    attr_reader :qp_emails 

    # @return [Hash] Email list statistics.
    attr_reader :qp_statistics

    def initialize (attributes)      
      @survey_id           = attributes['surveyID']
      @email_group_id      = attributes['emailGroupID']
      @name                = attributes['name']      
      @qp_emails           = attributes['email']
      @qp_statistics       = attributes['statistics']
      @unsubscribed        = attributes['unsubscribed']
      @total               = attributes['total']
      @active              = attributes['active']
      @pendin_verification = attributes['pendinVerification']
      @bounced             = attributes['bounced']
    end

    # Extract the email list statistics from qp_statistics attribute.
    #
    # @return [QuestionproRails::EmailListStatistic] Email List Statistics.
    def statistics
      extracted_statistics = []

      unless self.qp_statistics.nil?
        extracted_statistics.push(EmailListStatistic.new(qp_statistics))
      end

      return extracted_statistics
    end

    # Extract and seperate emails from qp_emails.
    #
    # @return [Array<String>] Emails.
    def emails
      unless self.qp_emails.nil?
        return self.qp_emails.split(',')
      end
    end
            
  end
end