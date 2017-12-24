class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :word
      t.string :title
      t.datetime :creation_date
      t.boolean :published
      t.text :content
      t.string :author

      t.timestamps
    end
  end
end
