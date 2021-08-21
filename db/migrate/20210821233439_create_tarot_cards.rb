class CreateTarotCards < ActiveRecord::Migration[6.0]
  def change
    create_table :tarot_cards do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :arcana

      t.timestamps
    end
  end
end
