class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.string :caption
    	t.integer :course_id
      t.timestamps
    end
  end
end
