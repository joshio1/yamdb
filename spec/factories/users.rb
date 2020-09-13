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
FactoryBot.define do
  factory :user do
    email { 'abc@example.com' }
    password { 'test_password' }
    age { 1 }
  end
end
