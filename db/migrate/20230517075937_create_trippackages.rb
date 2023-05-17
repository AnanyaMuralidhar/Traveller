class CreateTrippackages < ActiveRecord::Migration[7.0]
  def change
    create_table :trippackages do |t|
      t.string :package_name
      t.string :destination
      t.datetime :departure
      t.datetime :arrival
      t.text :description

      t.timestamps
    end
  end
end
