module S3
  # This is a fake library for the purpose of the workshop.
  # Please consider that this is an external library: do not change this file.

  def self.table_name_prefix
    's3_'
  end

  def self.get_bucket(name)
    S3::Bucket.new(name)
  end
end
