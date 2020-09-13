# This module is responsible for interacting with the TMDB service
module Tmdb
  API_KEY = Rails.application.secrets.tmdb_key
  BASE_URL = 'https://api.themoviedb.org/3'.freeze
  INCLUDE_ADULT_MOVIES = false

  def self.movie_results(certification: nil)
    url = "#{BASE_URL}/discover/movie?api_key=#{API_KEY}"
    url += '&language=en-US&sort_by=popularity.desc&include_video=false'
    url += "&include_adult=#{INCLUDE_ADULT_MOVIES}"
    url += '&region=US'
    url += "&certification.lte=#{certification}&certification_country=US" if certification.present?
    url += '&page=1'
    status, response = HttpWrapper.get(url)
    raise Errors::TmdbInteractionFailure, 'Unable to get movies from TMDB.' if status != 200 || response.blank?

    movies_wrapper = ResponseWrapper.new(Movie, HashWithIndifferentAccess.new(response))
    movies_wrapper.results
  end

  def self.release_date_results(movie_id)
    url = "#{BASE_URL}/movie/#{movie_id}/release_dates?api_key=#{API_KEY}"
    status, response = HttpWrapper.get(url)
    raise Errors::TmdbInteractionFailure, "Unable to get release dates for movie id #{movie_id}." if status != 200 || response.blank?

    movies_wrapper = ResponseWrapper.new(ReleaseDateResult, HashWithIndifferentAccess.new(response))
    movies_wrapper.results
  end
end
