module QuestionproRails
  class EmailListStatistic

    attr_reader :unsubscribed, :total, :active, 
                :pendin_verification, :bounced

    def initialize (attributes)
      @unsubscribed = attributes['unsubscribed']
      @total = attributes['total']
      @active = attributes['active']
      @pendin_verification = attributes['pendinVerification']
      @bounced = attributes['bounced']
    end                
            
  end
end
