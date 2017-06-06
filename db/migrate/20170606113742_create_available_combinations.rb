class CreateAvailableCombinations < ActiveRecord::Migration[5.1]
  def change
    create_table :available_combinations do |t|
      t.text :combis

      t.timestamps
    end
  end
end
