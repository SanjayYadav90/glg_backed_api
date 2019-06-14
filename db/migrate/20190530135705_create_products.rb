class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.bigint :cream_level_id
      t.string :title
      t.text :description
      t.boolean :status
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
  end
end
