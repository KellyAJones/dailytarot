# == Schema Information
#
# Table name: daily_spreads
#
#  id            :integer          not null, primary key
#  reflection    :text
#  sent          :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  tarot_card_id :integer
#  user_id       :integer
#
class DailySpread < ApplicationRecord
end
