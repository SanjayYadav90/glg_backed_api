class CreateCattles < ActiveRecord::Migration[5.2]
  def change
    create_table :cattles do |t|
      t.references :admin_user, foreign_key: true
      t.references :cattle_category, foreign_key: true
      t.references :cattle_breed, foreign_key: true
      t.references :cattle_variant, foreign_key: true
      t.string :title, limit: 70
      t.text :description
      t.datetime :purchase_date
      t.decimal :amount, precision: 7, scale: 2
      t.string :tag_no
      t.bigint :created_by

      t.timestamps
    end
  end
end
