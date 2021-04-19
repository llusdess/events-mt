# frozen_string_literal: true
class CreateOrganizations < ActiveRecord::Migration[6.0]
  def up
    create_table :organizations, id: :uuid do |t|
      t.string :name, null: false, unique: true
      t.string :slug, null: false, unique: true
      t.integer :users_count, null: false, default: 0
      t.timestamps
    end

    execute <<-SQL
      CREATE TYPE organization_status AS ENUM ('active', 'closed');
    SQL

    add_column :organizations, :status, :organization_status
  end

  def down
    drop_table :organizations

    execute <<-SQL
      DROP TYPE organization_status;
    SQL
  end
end
