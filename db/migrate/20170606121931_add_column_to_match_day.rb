class AddColumnToMatchDay < ActiveRecord::Migration[5.1]
  def change
    add_reference :match_days, :available_combination, foreign_key: true
  end
end
