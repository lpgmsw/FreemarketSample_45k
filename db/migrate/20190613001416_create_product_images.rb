class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.references :product
      t.string :image, null: false
      t.timestamps
    end
  end
end
