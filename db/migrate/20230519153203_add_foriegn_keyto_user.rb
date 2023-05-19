class AddForiegnKeytoUser < ActiveRecord::Migration[7.0]
  def change
      add_reference :slots, :user, foreign_key: true
      add_reference :slots, :trippackage, foreign_key: true
      add_reference :trippackages, :company, foreign_key: true
  end
end
