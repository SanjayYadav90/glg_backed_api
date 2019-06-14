class CreateProductOrigins < ActiveRecord::Migration[5.2]
  def change
    create_table :product_origins do |t|
      t.bigint :category_id
      t.string :title, limit: 70
      t.text :description
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :status

      t.timestamps
    end
  end
end
