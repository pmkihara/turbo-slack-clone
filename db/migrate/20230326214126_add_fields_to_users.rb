class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :display_name, :string
    add_column :users, :full_name, :string
    add_column :users, :title, :string
    add_column :users, :image_url, :string
  end
end
