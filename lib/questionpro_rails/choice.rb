module QuestionproRails
  class Choice

    attr_reader :score, :is_default, :exclude_randomize, :id, :text

    def initialize (attributes)
      @id = attributes['id']
      @score = attributes['score']
      @is_default = attributes['isDefault']
      @exclude_randomize = attributes['excludeRandomize']      
      @text = attributes['text']      
    end

  end
end