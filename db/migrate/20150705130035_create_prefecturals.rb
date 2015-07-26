class CreatePrefecturals < ActiveRecord::Migration
  def change
    create_table :prefecturals do |t|
      t.string :name
    end
  end
end
