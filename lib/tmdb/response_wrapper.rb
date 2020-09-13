module Tmdb
  # This class wraps the response from TMDB
  class ResponseWrapper
    include ActiveModel::Model

    attr_accessor :page, :total_results, :id, :total_pages
    attr_reader :results

    def initialize(entity, attributes)
      @entity = entity
      self.attributes = attributes
    end

    def results=(results)
      @results = results.map { |result| @entity.new result }
    end
  end
end
