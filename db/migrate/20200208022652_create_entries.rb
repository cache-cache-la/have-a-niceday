class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :title,    null: false
      t.string :text,     null: false
      t.string :image
      t.text :url
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
