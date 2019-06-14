class CreateCattles < ActiveRecord::Migration[5.2]
  def change
    create_table :cattles do |t|
      t.bigint :admin_user_id
      t.bigint :cattle_variant_id
      t.string :title, limit: 70
      t.text :description
      t.datetime :purchase_date
      t.decimal :amount, precision: 7, scale: 2
      t.string :tag_no
      t.bigint :parent_cattle_id
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
  end
end
