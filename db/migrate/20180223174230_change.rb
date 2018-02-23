class Change < ActiveRecord::Migration[5.1]
  def change
rename_column :comments, :post_id, :blog_id

  end
end
