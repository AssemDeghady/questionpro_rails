module QuestionproRails
  class EmailBatch

    attr_reader :id, :email_group, :viewed, :completed, :participation_rate, 
                :batch_type, :participation_pending, :timestamp, :initial_sent, :status

    def initialize (attributes)
      @id = attributes['batchID']
      @email_group = attributes['emailGroup']
      @viewed = attributes['viewed']
      @completed = attributes['completed']      
      @participation_rate = attributes['participationRate']
      @batch_type = attributes['batchType']
      @participation_pending = attributes['participationPending']
      @timestamp = attributes['timestamp']
      @initial_sent = attributes['initialSent']
      @status = attributes['status']
    end

  end
end