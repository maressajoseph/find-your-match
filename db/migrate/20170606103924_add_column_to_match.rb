class AddColumnToMatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :match_day, foreign_key: true
  end
end
