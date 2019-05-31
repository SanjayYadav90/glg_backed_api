class CreateCattleBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :cattle_breeds do |t|
      t.references :cattle_category, foreign_key: true
      t.string :title, limit: 70
      t.text :description
      t.bigint :created_by

      t.timestamps
    end
  end
end
