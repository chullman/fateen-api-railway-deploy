class AddUserToPredictions < ActiveRecord::Migration[7.0]
  def change
    add_reference :predictions, :user, null: false, foreign_key: true
  end
end
