class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :homelocation, :string
    add_column :users, :phoneno, :string
  end
end
