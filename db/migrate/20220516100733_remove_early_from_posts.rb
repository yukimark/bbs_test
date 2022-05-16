class RemoveEarlyFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :early, :string
  end
end
