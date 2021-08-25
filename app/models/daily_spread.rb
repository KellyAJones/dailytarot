# == Schema Information
#
# Table name: daily_spreads
#
#  id              :integer          not null, primary key
#  reflection      :text
#  sent            :boolean
#  tarot_card_name :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tarot_card_id   :integer
#  user_id         :integer
#
class DailySpread < ApplicationRecord
  validate :daily_validation, :on => :create

  belongs_to(:user, { :counter_cache => true })

  belongs_to(:tarot_card)

  
  def daily_validation
    if user.daily_spreads.count >= 1
      errors.add(:created_at, "Can't pull two cards on the same day")
    end
  end

  scope :today, -> { where(:created_at => (Time.now.beginning_of_day..Time.now.end_of_day)) }
  

end 
