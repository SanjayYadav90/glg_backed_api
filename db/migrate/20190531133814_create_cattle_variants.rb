class CreateCattleVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :cattle_variants do |t|
      t.references :cattle_breed, foreign_key: true
      t.string :title, limit: 70
      t.text :description
      t.bigint :created_by

      t.timestamps
    end
  end
end
