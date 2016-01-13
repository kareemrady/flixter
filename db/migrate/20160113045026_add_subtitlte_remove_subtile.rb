class AddSubtitlteRemoveSubtile < ActiveRecord::Migration
  def change
  	add_column :lessons, :subtitle, :string
  	remove_column :lessons, :subtile, :string
  end
end
