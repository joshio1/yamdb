require 'rails_helper'

RSpec.feature 'Movies', type: :feature do
  describe 'index' do
    it 'does not show movies above G for a user with age less than 5' do
      authenticate(create(:user, age: 3))
      rating_does_not_contain(Movie::Rating.new(:PG).display_name)
    end

    it 'does not show movies above PG for a user with age less than 13' do
      authenticate(create(:user, age: 12))
      rating_does_not_contain(Movie::Rating.new(:'PG-13').display_name)
    end

    it 'does not show movies above PG-13 for a user with age less than 18' do
      authenticate(create(:user, age: 15))
      rating_does_not_contain(Movie::Rating.new(:R).display_name)
    end

    it 'shows R-rated movies for a user with age more than 18' do
      authenticate(create(:user, age: 24))
      rating_contains(Movie::Rating.new(:R).display_name)
    end
  end
end

def authenticate(user)
  visit new_session_path
  within('form') do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
  end
  click_button 'Login'
  expect(page).to have_content("Logged in as #{user.email} having age #{user.age}")
  expect(page).to have_content('Movies')
end

def rating_does_not_contain(rating)
  ratings = all('#movies_tbl tr > td:nth-child(2)').map(&:text)
  expect(ratings).not_to include rating
end

def rating_contains(rating)
  ratings = all('#movies_tbl tr > td:nth-child(2)').map(&:text)
  expect(ratings).to include rating
end
