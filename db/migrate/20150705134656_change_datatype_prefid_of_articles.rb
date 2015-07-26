class ChangeDatatypePrefidOfArticles < ActiveRecord::Migration
  def change
    rename_column :users, :area_id, :pref_id
  end
end
