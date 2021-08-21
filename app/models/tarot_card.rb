# == Schema Information
#
# Table name: tarot_cards
#
#  id          :integer          not null, primary key
#  arcana      :integer
#  description :text
#  image       :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class TarotCard < ApplicationRecord
end
