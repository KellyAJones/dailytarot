class CreateDailySpreads < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_spreads do |t|
      t.integer :tarot_card_id
      t.integer :user_id
      t.boolean :sent

      t.timestamps
    end
  end
end
