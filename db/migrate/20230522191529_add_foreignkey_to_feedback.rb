class AddForeignkeyToFeedback < ActiveRecord::Migration[7.0]
  def change
    add_reference :feedbacks, :user, foreign_key: true
    add_reference :feedbacks, :company, foreign_key: true
  end
end
