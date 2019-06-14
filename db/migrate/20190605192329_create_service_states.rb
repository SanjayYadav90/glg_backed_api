class CreateServiceStates < ActiveRecord::Migration[5.2]
  def change
    create_table :service_states do |t|
      t.bigint :admin_user_id
      t.string :title, limit: 120
      t.datetime :started_at
      t.text :remarks
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :status, default: 0, null: false

      t.timestamps
    end
  end
end
