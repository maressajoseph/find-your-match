class AddStudent1andStudent2ToMatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :student1
    add_reference :matches, :student2

    add_foreign_key :matches, :users, column: :student1_id
    add_foreign_key :matches, :users, column: :student2_id
  end
end
