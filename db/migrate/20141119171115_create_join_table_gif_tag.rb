class CreateJoinTableGifTag < ActiveRecord::Migration
  def change
    create_join_table :gifs, :tags do |t|
    end
  end
end
