# frozen_string_literal: true
class CreateOrganizationUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :organization_users do |t|
      t.uuid :organization_id, null: false, index: true, foreign_key: true
      t.uuid :user_id,         null: false, index: true, foreign_key: true
      t.timestamps
    end

    execute <<-SQL
      CREATE TYPE user_role AS ENUM ('owner', 'administrator', 'manager', 'staff', 'assistant', 'collaborator');
    SQL

    add_column :organization_users, :role, :user_role, null: false
  end

  def down
    drop_table :organization_users

    execute <<-SQL
      DROP TYPE user_role;
    SQL
  end
end
