module Errors
  # This class handles any error with the TMDB API
  class TmdbInteractionFailure < YamdbError
    def initialize(message = 'Error in interacting with TMDB')
      super(error: :tmdb_interaction_failure, status: 422, message: message)
    end
  end
end
