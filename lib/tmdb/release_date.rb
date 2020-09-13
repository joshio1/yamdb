module Tmdb
  # This class is used to deserialize release date response from TMDB
  class ReleaseDate
    include ActiveModel::Model

    attr_accessor \
      :certification,
      :iso_639_1,
      :note,
      :release_date,
      :type
  end
end
