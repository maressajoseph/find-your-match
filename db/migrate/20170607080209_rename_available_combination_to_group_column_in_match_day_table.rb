class RenameAvailableCombinationToGroupColumnInMatchDayTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :match_days, :available_combination_id, :group_id
  end
end
