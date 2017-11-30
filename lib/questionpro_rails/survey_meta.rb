require "questionpro_rails/email_group"
require "questionpro_rails/template"

module QuestionproRails
  class SurveyMeta

    attr_reader :email_groups_list, :templates_list
    
    def initialize (attributes)
      @email_groups_list = attributes['emailGroups']
      @templates_list = attributes['templates']
    end

    def email_groups
      extracted_groups = []

      unless self.email_groups_list.empty? 
        self.email_groups_list.each do |email_group|
          extracted_groups.push(EmailGroup.new(email_group))
        end
      end

      return extracted_groups
    end

    def templates
      extracted_templates = []

      unless self.templates_list.empty? 
        self.templates_list.each do |template|
          extracted_templates.push(Template.new(template))
        end
      end

      return extracted_templates      
    end
  end
end