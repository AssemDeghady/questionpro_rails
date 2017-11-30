module QuestionproRails
  class Template

    attr_reader :id, :template_subject

    def initialize (attributes) 
      @id = attributes['templateID']
      @template_subject = attributes['templateSubject']          
    end 

  end
end