class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.boolean :nsfw
    end
  end
end
