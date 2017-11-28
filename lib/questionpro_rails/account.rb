module QuestionproRails
  class Account

    attr_reader :id, :first_name, :last_name, :last_login, :email_address, 
                :account_type, :creation_date, :phone

      def initialize (attributes)
        @id = attributes['userID']
        @first_name = attributes['firstName']
        @last_name = attributes['lastName']
        @last_login = attributes['lastLogin']
        @email_address = attributes['emailAddress']
        @phone = attributes['phone']
        @account_type = attributes['accountType']
        @creation_date = attributes['creationDate']        
      end
  end
end
