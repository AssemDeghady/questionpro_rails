require "questionpro_rails/email_group"
require "questionpro_rails/template"

module QuestionproRails
  class SurveyMeta

    # @return [Array<Hash>] Email Groups List collected from the survey meta.
    attr_reader :email_groups_list

    # @return [Array<Hash>] Templates List collected from the survey meta.
    attr_reader :templates_list
    
    def initialize (attributes)
      @email_groups_list = attributes['emailGroups']
      @templates_list    = attributes['templates']
    end

    # Extract the Email Groups from the hashes stored
    # inside email_groups_list attribute.
    #
    # @return [Array<QuestionproRails::EmailGroup>] Email Groups.
    def email_groups
      extracted_groups = []

      unless self.email_groups_list.nil? 
        self.email_groups_list.each do |email_group|
          extracted_groups.push(EmailGroup.new(email_group))
        end
      end

      return extracted_groups
    end

    # Extract the Templates from the hashes stored
    # inside templates_list attribute.
    #
    # @return [Array<QuestionproRails::Template>] Templates.
    def templates
      extracted_templates = []

      unless self.templates_list.nil? 
        self.templates_list.each do |template|
          extracted_templates.push(Template.new(template))
        end
      end

      return extracted_templates      
    end
  end
end