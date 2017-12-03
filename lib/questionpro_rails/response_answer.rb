module QuestionproRails
  class ResponseAnswer
    
    attr_reader :id, :answer_text, :value    

    def initialize (attributes)
      @id          = attributes['id']
      @answer_text = attributes['answerText']      
      @value       = attributes['value']      
    end

  end
end