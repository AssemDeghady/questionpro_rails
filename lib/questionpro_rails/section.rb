require "questionpro_rails/question"

module QuestionproRails
	class Section

		attr_reader :id, :num_tasks, :exact_min_answers, :orientation, :code, 
                :max_answers, :required, :has_page_break, :type, 
                :dynamic_explode_text, :video, :video_type, :min_answers,
                :random, :random_section, :subtype, :mobile_friendly

    # @return [Array<Hash>] Questions collected inside the section.
    attr_reader :qp_questions

		def initialize(attributes)
      @id                   = attributes['sectionID']
			@num_tasks            = attributes['numTasks']
			@exact_min_answers    = attributes['exactMinAnswers']
			@orientation          = attributes['orientation']
			@code                 = attributes['code']
			@video_type           = attributes['videoType']
			@max_answers          = attributes['maxAnswers']			
			@dynamic_explode_text = attributes['dynamicExplodeText']			
			@video                = attributes['video']
			@type                 = attributes['type']
			@min_answers          = attributes['minAnswers']
			@required             = attributes['required']
			@has_page_break       = attributes['hasPageBreak']
			@random               = attributes['random']
			@random_section       = attributes['randomSection']
			@subtype              = attributes['subtype']
			@mobile_friendly      = attributes['mobileFriendly']	
			@qp_questions         = attributes['questions']					
		end

    # Extract the Questions from the hashes stored
    # inside qp_questions attribute.
    #
    # @return [Array<QuestionproRails::Question>] Questions.
		def questions
      extracted_questions = []

      if self.qp_questions.any?
        self.qp_questions.each do |question|   
          extracted_questions.push(Question.new(question))
        end           
      end

      return extracted_questions			
		end

	end
end