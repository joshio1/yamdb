require 'rails_helper'

RSpec.feature 'Dashboard', type: :feature do
  describe 'index' do
    it 'shows the login page and SignUp button' do
      visit root_path
      expect(page).to have_content('Login')
      expect(page).to have_content('New User?')
    end
  end
end
