class AddAttentionToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :attention, :integer
  end
end
