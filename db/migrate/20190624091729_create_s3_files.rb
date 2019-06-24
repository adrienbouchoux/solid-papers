class CreateS3Files < ActiveRecord::Migration[5.2]
  def change
    create_table :s3_files do |t|
      t.string :bucket_name
      t.string :file_name
      t.text :contents

      t.timestamps
    end
  end
end
