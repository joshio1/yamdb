# This controller is responsible for the actions on the home page
class DashboardController < ApplicationController
  skip_before_action :authorized

  def show
    redirect_to current_user ? movies_path : new_session_path
  end
end
