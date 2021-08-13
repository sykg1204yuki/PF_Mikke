class CreateDiscovers < ActiveRecord::Migration[5.2]
  def change
    create_table :discovers do |t|

      t.integer :user_id
      t.integer :post_image_id

      t.timestamps
    end
  end
end
