class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.references :product, foreign_key: true
      t.references :servise_state, foreign_key: true
      t.string :title, limit: 110
      t.decimal :price, precision: 7, scale: 2
      t.text :description
      t.bigint :created_by
      t.boolean :status, default: 0, null: false

      t.timestamps
    end
  end
end
