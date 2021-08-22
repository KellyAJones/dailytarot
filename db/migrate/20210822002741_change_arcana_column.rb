class ChangeArcanaColumn < ActiveRecord::Migration[6.0]
  def change

    change_column :tarot_cards, :arcana, :string
  end
end
