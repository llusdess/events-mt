# frozen_string_literal: true
class AddPersonForeignKeyToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :person, type: :uuid, index: true, foreign_key: true
  end
end
