module Tmdb
  # This class holds the movie object from the TMDB API
  class Movie
    include ActiveModel::Model

    attr_accessor \
      :popularity,
      :vote_count,
      :video,
      :poster_path,
      :id,
      :adult,
      :backdrop_path,
      :original_language,
      :original_title,
      :genre_ids,
      :title,
      :vote_average,
      :overview,
      :release_date
  end
end
