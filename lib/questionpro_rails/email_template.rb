module QuestionproRails
  class EmailTemplate

    attr_reader :id, :survey_id, :title, :content_summary
    
    def initialize (attributes)
      @id              = attributes['templateID']
      @survey_id       = attributes['surveyID']      
      @title           = attributes['title']
      @content_summary = attributes['contentSummary'] 
    end

  end
end