class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :state

      t.timestamps null: false
    end
  end
end
