module QuestionproRails
  class SurveyResponseCount

    attr_reader :id, :name, :partial_count, :overall_viewed_count, :overall_complete_count, 
                :overall_terminated_count, :terminated_count, :overall_started_count, 
                :complete_count, :started_count, :status

    def initialize (attributes)
      @id                       = attributes['id']
      @name                     = attributes['name']
      @partial_count            = attributes['partialCount']
      @overall_viewed_count     = attributes['overallViewedCount']
      @overall_complete_count   = attributes['overallCompleteCount']
      @overall_terminated_count = attributes['overallTerminatedCount']
      @terminated_count         = attributes['terminatedCount']
      @overall_started_count    = attributes['overallStartedCount']
      @complete_count           = attributes['completeCount']
      @started_count            = attributes['startedCount']
      @status                   = attributes['status']
    end

  end
end