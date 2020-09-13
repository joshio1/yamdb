module Tmdb
  # This class is used to deserialize the release date result from TMDB
  class ReleaseDateResult
    include ActiveModel::Model

    attr_accessor :iso_3166_1

    attr_reader :release_dates

    def united_states?
      iso_3166_1 == 'US'
    end

    def release_dates=(release_dates)
      @release_dates = release_dates.map { |result| ReleaseDate.new(result) }
    end
  end
end
