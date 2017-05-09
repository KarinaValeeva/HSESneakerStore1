class AddImageToSneakers < ActiveRecord::Migration[5.1]
  def change
    add_column :sneakers, :image, :string
  end
end
