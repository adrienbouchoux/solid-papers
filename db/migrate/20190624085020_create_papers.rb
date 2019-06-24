class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.string :title
      t.string :author
      t.string :content
      t.datetime :archived_at

      t.timestamps
    end
  end
end
