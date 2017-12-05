require "questionpro_rails/response_set"

module QuestionproRails
  class SurveyResponse

    attr_reader :id, :country, :duplicate, :external_reference, 
                :ip_address, :region, :response_status,
                :time_taken, :timestamp

    # @return [Array<Hash>] Response Set collected from the survey response.
    attr_reader :qp_response_set

    def initialize (attributes)
      @id                 = attributes['id']
      @country            = attributes['country']
      @duplicate          = attributes['duplicate']
      @external_reference = attributes['externalReference']
      @ip_address         = attributes['ipAddress']
      @region             = attributes['region']
      @qp_response_set    = attributes['responseSet']
      @response_status    = attributes['responseStatus']
      @time_taken         = attributes['timeTaken']
      @timestamp          = attributes['timestamp']      
    end

    # Extract the Response Set from the hash stored
    # inside qp_response_set attribute.
    #
    # @return [Array<QuestionproRails::ResponseSet>] Response Sets. 
    def response_set
      extracted_sets = []

      unless self.qp_response_set.nil?
        self.qp_response_set.each do |set|   
          extracted_sets.push(ResponseSet.new(set))
        end           
      end

      return extracted_sets
    end
  end  
end