class RemoveImageUrlFromChannels < ActiveRecord::Migration[7.0]
  def change
    remove_column :channels, :image_url, :string
  end
end
