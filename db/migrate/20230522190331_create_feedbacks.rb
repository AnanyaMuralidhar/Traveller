class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.integer :rate
      t.text :descr

      t.timestamps
    end
  end
end
