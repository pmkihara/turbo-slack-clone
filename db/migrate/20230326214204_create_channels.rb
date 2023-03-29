class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :image_url
      t.string :description
      t.boolean :private, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
