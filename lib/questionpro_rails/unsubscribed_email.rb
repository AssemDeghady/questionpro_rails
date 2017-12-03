module QuestionproRails
  class UnsubscribedEmail

    attr_reader :id, :email, :unsubscribed_time

    def initialize (attributes)
      @id                = attributes['id']
      @email             = attributes['emailAddress']
      @unsubscribed_time = attributes['unsubscribedTime']
    end
  end
end