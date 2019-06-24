class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :content
      t.datetime :archived_at

      t.timestamps
    end
  end
end
