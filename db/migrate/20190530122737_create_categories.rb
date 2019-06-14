class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.bigint :admin_user_id
      t.string :title
      t.text :description
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :status

      t.timestamps
    end
  end
end
