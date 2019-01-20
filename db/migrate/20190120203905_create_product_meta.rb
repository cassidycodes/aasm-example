class CreateProductMeta < ActiveRecord::Migration
  def change
    create_table :product_meta do |t|
      t.text :note
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
