class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.integer :width
      t.integer :height
      t.string :print_type
      t.decimal :price

      t.timestamps
    end
  end
end
