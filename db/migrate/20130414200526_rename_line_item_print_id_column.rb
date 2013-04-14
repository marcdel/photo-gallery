class RenameLineItemPrintIdColumn < ActiveRecord::Migration
  def change
    rename_column :line_items, :print_id, :photo_print_id
  end
end
