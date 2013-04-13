class CreatePhotoPrints < ActiveRecord::Migration
  def change
    create_table :photo_prints do |t|
      t.integer :photo_id
      t.integer :print_id

      t.timestamps
    end

    add_index :photo_prints, :photo_id
    add_index :photo_prints, :print_id
    add_index :photo_prints, [:photo_id, :print_id], unique: true
  end
end
