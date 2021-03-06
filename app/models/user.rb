# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  age             :integer
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  # validations ...............................................................

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # instance methods ..........................................................
end
