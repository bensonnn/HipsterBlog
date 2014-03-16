class AddsIsHipsterColumnToWords < ActiveRecord::Migration
  def change
    add_column :words, :is_hipster, :boolean
  end
end
