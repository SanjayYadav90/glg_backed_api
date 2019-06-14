class CreateCattleBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :cattle_breeds do |t|
      t.bigint :cattle_category_id
      t.string :title, limit: 70
      t.text :description
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
  end
end
