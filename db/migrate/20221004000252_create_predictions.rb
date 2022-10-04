class CreatePredictions < ActiveRecord::Migration[7.0]
  def change
    create_table :predictions do |t|
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
