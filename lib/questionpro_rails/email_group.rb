module QuestionproRails
  class EmailGroup

    attr_reader :id, :email_group_name

    def initialize (attributes) 
      @id = attributes['emailGroupID']
      @email_group_name = attributes['emailGroupName']          
    end

  end
end