class AddCatId < ActiveRecord::Migration
  def up
    add_column :posts, :category_id, :integer
  end

  def down
    remove_column :posts, :category_id, :integer
  end
end
