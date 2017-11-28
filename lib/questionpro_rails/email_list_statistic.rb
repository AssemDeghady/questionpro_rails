module QuestionproRails
  class EmailListStatistic

    attr_reader :statistics, :unsubscribed, :total, :active, 
                :pendin_verification, :bounced

    def initialize (attributes)
      @statistics = attributes['statistics']
      @unsubscribed = attributes['unsubscribed']
      @total = attributes['total']
      @active = attributes['active']
      @pendin_verification = attributes['pendinVerification']
      @bounced = attributes['bounced']
    end                
            
  end
end
