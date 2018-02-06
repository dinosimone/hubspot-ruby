require 'hubspot/utils'

module Hubspot
  #
  # HubSpot Files API
  #
  # {https://developers.hubspot.com/docs/methods/files/post_files}
  #
  class File
    GET_FILE_PATH    = "/filemanager/api/v2/files/:file_id"	  
    DELETE_FILE_PATH = "/filemanager/api/v2/files/:file_id/full-delete" 

    attr_reader :id
    attr_reader :properties

    def initialize(response_hash)
      @id = response_hash["id"]
      @properties = response_hash
    end

    class << self
      def find(file_id)
        response = Hubspot::Connection.get_json(GET_FILE_PATH, { file_id: file_id })
	new(response)
      end
    end


    def destroy!
      Hubspot::Connection.post_json(DELETE_FILE_PATH, params: {file_id: id} )
    end

  end
end
