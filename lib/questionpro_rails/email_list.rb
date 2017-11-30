require "questionpro_rails/email_list_statistic"

module QuestionproRails
  class EmailList

    attr_reader :survey_id, :name, :email_group_id, :qp_emails, :qp_statistics, 
                :unsubscribed, :total, :active, :pendin_verification, :bounced

    def initialize (attributes)      
      @survey_id = attributes['surveyID']
      @email_group_id = attributes['emailGroupID']
      @name = attributes['name']      
      @qp_emails = attributes['email']
      @qp_statistics = attributes['statistics']
      @unsubscribed = attributes['unsubscribed']
      @total = attributes['total']
      @active = attributes['active']
      @pendin_verification = attributes['pendinVerification']
      @bounced = attributes['bounced']
    end

    def statistics
      extracted_statistics = []

      if self.qp_statistics.any?
        extracted_statistics.push(EmailListStatistic.new(qp_statistics))
      end

      return extracted_statistics
    end

    def emails
      unless self.qp_emails.empty?
        return self.qp_emails.split(',')
      end
    end
            
  end
end