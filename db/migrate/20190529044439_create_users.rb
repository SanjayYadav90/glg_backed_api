class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :salutaion
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :mobile
      t.string :password_digest
      t.boolean :call_verified
      t.boolean :premimum
      t.string :status, default: 'inactive', null: false
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end
  end
end
