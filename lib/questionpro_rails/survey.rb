module QuestionproRails
  class Survey

    attr_reader :id, :name, :subtitle, :url, :thank_you_message, 
                :has_scoring_logic, :numeric_title, :status, :sections

    def initialize (attributes)
      @id = (attributes['id'] || attributes['surveyID']) 
      @name = (attributes['title'] || attributes['surveyName'])
      @url = (attributes['surveyURL'] || attributes['connectURL'])
      @subtitle = attributes['subtitle']
      @thank_you_message = attributes['thankYouMessage']
      @has_scoring_logic = attributes['hasScoringLogic']
      @numeric_title = attributes['numericTitle']
      @status = attributes['status']
      @sections = attributes['sections']
    end

  end
end