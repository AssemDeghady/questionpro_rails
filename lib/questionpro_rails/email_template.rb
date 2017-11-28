module QuestionproRails
  class EmailTemplate

    attr_reader :survey_id, :template_id, :title, :content_summary
    
    def initialize (attributes)
      @survey_id = attributes['surveyID']
      @template_id = attributes['templateID']
      @title = attributes['title']
      @content_summary = attributes['contentSummary'] 
    end

  end
end