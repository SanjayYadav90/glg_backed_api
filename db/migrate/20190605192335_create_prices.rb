class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.bigint :product_id
      t.bigint :service_state_id
      t.string :title, limit: 110
      t.decimal :price, precision: 7, scale: 2
      t.text :description
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :status, default: 0, null: false

      t.timestamps
    end
  end
end
