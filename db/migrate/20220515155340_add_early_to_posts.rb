class AddEarlyToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :early, :string
  end
end
