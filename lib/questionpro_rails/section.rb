module QuestionproRails
	class section

		attr_reader :num_tasks, :exact_min_answers, :orientation, :code, :video_type, :max_answers, :questions,
 								:dynamic_explode_text, :section_id, :video, :type, :min_answers, :required, :has_page_break, 
 								:random, :random_section, :subtype, :mobile_friendly

		def initialize(attributes)
			@num_tasks = atrributes['numTasks']
			@exact_min_answers = atrributes['exactMinAnswers']
			@orientation = atrributes['orientation']
			@code = atrributes['code']
			@video_type = atrributes['videoType']
			@max_answers = atrributes['maxAnswers']
			@questions = atrributes['questions']	
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
		end
	end
end