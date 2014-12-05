class AddGifToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gif, :string
  end
end
