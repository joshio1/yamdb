# This class holds the model which is shown in the Movie views
class Movie
  include ActiveModel::Model

  # constants .................................................................

  # accessors .................................................................

  attr_accessor :title, :release_date, :popularity, :vote_average, :id

  # instance methods ..........................................................

  def rating
    release_details = Tmdb.release_date_results(id)
    united_states_release_details = release_details
                                    .filter(&:united_states?)
                                    .first
    ratings = united_states_release_details
                   &.release_dates
                   &.map(&:certification)
                   &.map { |certification| Rating.new(certification.to_sym) }
    Rating.max(ratings).display_name
  end

  # class methods .............................................................

  def self.from_tmdb(tmdb_movie)
    movie = Movie.new
    movie.attributes = tmdb_movie.instance_values.slice('id', 'title', 'release_date', 'popularity', 'vote_average')
    movie
  end

  def self.upto(rating)
    tmdb_movies = Tmdb.movie_results(certification: rating.display_name)
    tmdb_movies.map { |tmdb_movie| Movie.from_tmdb tmdb_movie }
  end

  # private methods ...........................................................
end
