class RenameAvailableCombinationToGroup < ActiveRecord::Migration[5.1]
  def change
    rename_table :available_combinations, :groups
  end
end
