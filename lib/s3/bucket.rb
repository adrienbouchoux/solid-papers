class S3
  class Bucket
    # This is a fake library for the purpose of the workshop.
    # Please consider that this is an external library: do not change this file.

    def initialize(name)
      @name = name
    end

    def create_file(file_name, contents)
      S3::File.create(bucket_name: @name, file_name: file_name, contents: contents)
    end
  end
end
