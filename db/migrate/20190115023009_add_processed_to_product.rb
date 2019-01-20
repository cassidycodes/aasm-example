class AddProcessedToProduct < ActiveRecord::Migration
  def change
    add_column :products, :processed, :boolean, default: false
  end
end
