class CreateProductVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :product_variants do |t|
      t.references :product, foreign_key: true
      t.string :title, limit: 110
      t.decimal :quantity, precision: 10, scale: 3
      t.string :batch_no
      t.datetime :used_by
      t.bigint :created_by
      t.boolean :status, default: 0, null: false

      t.timestamps
    end
  end
end
