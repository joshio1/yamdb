require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'new' do
    it 'creates a new user and sees a list of movies' do
      visit root_path
      click_link('New User?')
      expect(page).to have_content('Signup')
      new_user = build(:user)
      fill_in 'Email', with: new_user.email
      fill_in 'Password', with: new_user.password
      fill_in 'Password confirmation', with: new_user.password
      fill_in 'Age', with: new_user.age
      click_button 'Signup'
      expect(page).to have_content('Movies')
    end
  end
end
