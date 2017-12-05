require "questionpro_rails/choice"

module QuestionproRails
  class Question

    attr_reader :id, :order_number, :text

    # @return [Array<Hash>] Choices available for the question.
    attr_reader :qp_answers 

    def initialize (attributes)
      @id           = attributes['id']
      @order_number = attributes['orderNumber']          
      @text         = attributes['text']
      @qp_answers   = attributes['answers']
    end

    # Extract the choices from the hashes stored
    # inside qp_answers attribute.
    #
    # @return [Array<QuestionproRails::Choice>] Choices.
    def choices
      extracted_choices = []

      unless self.qp_answers.nil?
        self.qp_answers.each do |choice|   
          extracted_choices.push(Choice.new(choice))
        end           
      end

      return extracted_choices        
    end

  end
end