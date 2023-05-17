class AddBudgetToTrippackage < ActiveRecord::Migration[7.0]
  def change
    add_column :trippackages, :budget, :integer
  end
end
