class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
