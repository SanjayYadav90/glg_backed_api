class CreateCattleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :cattle_categories do |t|
      t.bigint :admin_user_id
      t.string :title, limit: 50
      t.text :description
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
  end
end
