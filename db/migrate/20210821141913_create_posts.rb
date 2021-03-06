class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :photo
      t.string :content
      t.references :user, null: false

      t.timestamps
    end
  end
end
