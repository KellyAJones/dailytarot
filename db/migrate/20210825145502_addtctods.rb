class Addtctods < ActiveRecord::Migration[6.0]
  def change

      add_column :daily_spreads, :tarot_card_name, :string

  end
end
