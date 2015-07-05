class AddProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile, :text
    add_column :users, :area_id, :integer
  end
end
