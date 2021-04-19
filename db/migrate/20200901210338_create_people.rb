# frozen_string_literal: true
class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people, id: :uuid do |t|
      t.string :last_name,         limit: 32, null: false
      t.string :first_name,        limit: 32, null: false
      t.string :prefered_name,     limit: 64
      t.string :prefix,            limit: 8
      t.string :suffix,            limit: 8
      t.string :degrees,           array: true, default: []
      t.string :tags,              array: true, default: []
      t.string :email,             limit: 254
      t.boolean :company,          default: false
      t.string :company_name,      limit: 128
      t.string :title,             limit: 128
      t.string :country_code,      limit: 2, default: "US"
      t.string :cell,              limit: 15
      t.string :phone,             limit: 15
      t.integer :phone_extension,  limit: 6
      t.string :fax,               limit: 15
      t.integer :fax_extension,    limit: 6

      t.timestamps
    end

    add_index :people, [:last_name, :first_name]
    add_index :people, [:email]
    add_index :people, :tags, using: "gin"
  end
end
