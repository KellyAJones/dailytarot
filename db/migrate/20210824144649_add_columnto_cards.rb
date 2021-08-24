class AddColumntoCards < ActiveRecord::Migration[6.0]
  def change
      add_column :tarot_cards, :card_id, :integer

  end
end
