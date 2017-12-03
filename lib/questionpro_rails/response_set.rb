require "questionpro_rails/response_answer"

module QuestionproRails
  class ResponseSet
    
    attr_reader :question_code, :question_description, :question_id, :question_text

    # @return [Array<Hash>] Answers collected from the survey response.
    attr_reader :qp_values

    def initialize (attributes)
      @question_code        = attributes['questionCode']
      @question_description = attributes['questionDescription']
      @question_id          = attributes['questionID']
      @question_text        = attributes['questionText']
      @qp_values            = attributes['values']      
    end

    # Extract the Answers from the hashes stored
    # inside qp_values attribute.
    #
    # @return [Array<QuestionproRails::ResponseAnswer>] Response Answers.
    def answers
      extracted_answers = []

      if self.qp_values.any?
        self.qp_values.each do |answer|   
          extracted_answers.push(ResponseAnswer.new(answer))
        end           
      end

      return extracted_answers      
    end

  end
end