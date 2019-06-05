class CreateCreamLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :cream_levels do |t|
      t.references :product_origin, foreign_key: true
      t.string :title, limit: 110
      t.decimal :fat_level, precision: 5, scale: 2
      t.text :description
      t.bigint :created_by
      t.boolean :status

      t.timestamps
    end
  end
end
