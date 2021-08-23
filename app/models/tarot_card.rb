# == Schema Information
#
# Table name: tarot_cards
#
#  id          :integer          not null, primary key
#  arcana      :string
#  description :text
#  image       :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class TarotCard < ApplicationRecord

  enum({ :arcana => { :major => 0, :minor => 1 } })

  has_many(:daily_spreads, { :dependent => :destroy })

  has_many(:users, { :through => :daily_spreads, :source => :user })
end
