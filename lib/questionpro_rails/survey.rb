require "questionpro_rails/section"

module QuestionproRails
  class Survey

    attr_reader :id, :name, :subtitle, :url, :thank_you_message, 
                :has_scoring_logic, :numeric_title, :status, :qp_sections

    def initialize (attributes)
      @id = (attributes['id'] || attributes['surveyID']) 
      @name = (attributes['title'] || attributes['surveyName'])
      @url = (attributes['surveyURL'] || attributes['connectURL'])
      @subtitle = attributes['subtitle']
      @thank_you_message = attributes['thankYouMessage']
      @has_scoring_logic = attributes['hasScoringLogic']
      @numeric_title = attributes['numericTitle']
      @status = attributes['status']
      @qp_sections = attributes['sections']
    end

    def sections
      extracted_sections = []

      if self.qp_sections.any?
        self.qp_sections.each do |section|   
          extracted_sections.push(Section.new(section))
        end           
      end

      return extracted_sections
    end

  end
end