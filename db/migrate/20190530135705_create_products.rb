class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.text :description
      t.decimal :price
      t.boolean :status
      t.string :created_by

      t.timestamps
    end
  end
end
