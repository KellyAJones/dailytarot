# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  daily_spreads_count :integer
#  email               :string
#  name                :string
#  opt_in              :boolean          default(TRUE)
#  password_digest     :string
#  phone_number        :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  
  has_secure_password

  has_many(:daily_spreads, { :dependent => :destroy })
  has_many(:tarot_cards, { :through => :daily_spreads, :source => :tarot_card })

  

end

#add a column for text_alert boo t/f set to false when you sign up, texting task queries all users whose text task value is true
#Users.where(text_updates => true)
#then the task loops through that collection and sends the text a random daily card for the day
