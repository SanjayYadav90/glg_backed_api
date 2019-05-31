class CreateCattleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :cattle_categories do |t|
      t.references :admin_user, foreign_key: true
      t.string :title, limit: 50
      t.text :description
      t.bigint :created_by

      t.timestamps
    end
  end
end
