class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :thumbnail_url
      t.string :content_url
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
