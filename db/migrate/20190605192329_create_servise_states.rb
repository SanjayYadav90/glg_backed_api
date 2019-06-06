class CreateServiseStates < ActiveRecord::Migration[5.2]
  def change
    create_table :servise_states do |t|
      t.references :admin_user, foreign_key: true
      t.string :title, limit: 120
      t.datetime :started_at
      t.text :remarks
      t.bigint :created_by
      t.boolean :status, default: 0, null: false

      t.timestamps
    end
  end
end
