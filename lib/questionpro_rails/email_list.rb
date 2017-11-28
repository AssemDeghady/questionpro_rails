require "questionpro_rails/email_list_statistic"

module QuestionproRails
  class EmailList

    attr_reader :survey_id, :name, :email_group_id, :email, :qp_statistics, 
                :unsubscribed, :total, :active, :pendin_verification, :bounced

    def initialize (attributes)
      @survey_id = attributes['surveyID']
      @name = attributes['name']
      @email_group_id = attributes['emailGroupID']
      @email = attributes['email']
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
        self.qp_statistics.each do |statistic|   
          extracted_statistics.push(EmailListStatistic.new(statistic))
        end
      end

      return extracted_statistics
    end

    def emails
      unless self.email.blank?
        return self.email.split(',')
      end
    end
            
  end
end