# This controller is responsible for actions related to movies
class MoviesController < ApplicationController
  def index
    @movies = policy_scope(Movie)
  end
end
