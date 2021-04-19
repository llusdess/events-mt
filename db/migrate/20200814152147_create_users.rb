# frozen_string_literal: true
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email,                      limit: 254, null: false
      t.string :username,                   limit: 64

      t.string :encrypted_password,         limit: 128
      t.string :confirmation_token,         limit: 128
      t.string :remember_token,             limit: 128

      t.string :first_name,                 limit: 32
      t.string :last_name,                  limit: 32

      ## Trackable
      t.datetime :locked_at
      t.integer  :failed_attempts,          null: false, default: 0
      t.integer  :sign_in_count,            null: false, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end
