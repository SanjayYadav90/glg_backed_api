class CreateCattleCurrentStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :cattle_current_statuses do |t|
      t.string :title, limit: 70
      t.string :calf_gender, limit: 50
      t.string :calf_live_status, limit: 50
      t.datetime :date_of_delivery
      t.decimal :quantity, precision: 5, scale: 3, default: 0.000
      t.decimal :calf_consumption, precision: 5, scale: 3, default: 0.000
      t.text :description
      t.bigint :created_by

      t.timestamps
    end
  end
end
