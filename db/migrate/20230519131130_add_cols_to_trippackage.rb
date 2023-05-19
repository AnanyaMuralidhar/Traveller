class AddColsToTrippackage < ActiveRecord::Migration[7.0]
  def change
    add_column :trippackages, :travelfrom, :string
    add_column :trippackages, :noofbookings, :integer
    add_column :trippackages, :packcountry, :string
  end
end
