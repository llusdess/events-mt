# frozen_string_literal: true
class EnablePsqlExtensions < ActiveRecord::Migration[6.0]
  def change
    enable_extension "pgcrypto"
    enable_extension "hstore"
    enable_extension "pg_trgm"
    enable_extension "fuzzystrmatch"
    enable_extension "moddatetime"
    enable_extension "insert_username"
  end
end
