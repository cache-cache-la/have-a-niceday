class AddIndexToEntries < ActiveRecord::Migration[5.2]
  def change
    add_index :entries, :text, length: 32
  end
end
