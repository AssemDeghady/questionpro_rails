require "questionpro_rails/choice"

module QuestionproRails
  class Question

    attr_reader :order_number, :qp_answers, :id, :text

    def initialize (attributes)
      @id = attributes['id']
      @order_number = attributes['orderNumber']          
      @text = attributes['text']
      @qp_answers = attributes['answers']
    end

    def choices
      extracted_choices = []

      if self.qp_answers.any?
        self.qp_answers.each do |choice|   
          extracted_choices.push(Choice.new(choice))
        end           
      end

      return extracted_choices        
    end

  end
end