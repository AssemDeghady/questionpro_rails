require "questionpro_rails/question"

module QuestionproRails
	class Section

		attr_reader :num_tasks, :exact_min_answers, :orientation, :code, :video_type, :max_answers, :qp_questions,
 								:dynamic_explode_text, :section_id, :video, :type, :min_answers, :required, :has_page_break, 
 								:random, :random_section, :subtype, :mobile_friendly

		def initialize(attributes)
			@num_tasks = attributes['numTasks']
			@exact_min_answers = attributes['exactMinAnswers']
			@orientation = attributes['orientation']
			@code = attributes['code']
			@video_type = attributes['videoType']
			@max_answers = attributes['maxAnswers']			
			@dynamic_explode_text = attributes['dynamicExplodeText']
			@section_id = attributes['sectionID']
			@video = attributes['video']
			@type = attributes['type']
			@min_answers = attributes['minAnswers']
			@required = attributes['required']
			@has_page_break = attributes['hasPageBreak']
			@random = attributes['random']
			@random_section = attributes['randomSection']
			@subtype = attributes['subtype']
			@mobile_friendly = attributes['mobileFriendly']	
			@qp_questions = attributes['questions']					
		end

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