class CreateCattleVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :cattle_variants do |t|
      t.bigint :cattle_breed_id
      t.string :title, limit: 70
      t.text :description
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
  end
end
