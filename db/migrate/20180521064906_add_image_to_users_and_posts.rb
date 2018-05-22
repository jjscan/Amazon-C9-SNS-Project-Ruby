class AddImageToUsersAndPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :string
    add_column :posts, :image, :string
  end
end
