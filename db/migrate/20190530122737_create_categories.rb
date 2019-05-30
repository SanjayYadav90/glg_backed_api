class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.bigint :created_by
      t.boolean :status
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
