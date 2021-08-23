class AddReflectiontoDailySpread < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_spreads, :reflection, :text
  end
end
