class CreateMatchDays < ActiveRecord::Migration[5.1]
  def change
    create_table :match_days do |t|
      t.date :day

      t.timestamps
    end
  end
end
