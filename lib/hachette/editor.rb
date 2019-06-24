module Hachette
  class Editor
    # This is a fake library for the purpose of the workshop.
    # Please consider that this is an external library: do not change this file.

    def initialize(editor)
      @editor = editor
    end

    # This method implements a very complex algorithm.
    # Obviously, it is so complex that we don't want to implement it ourselves!
    def pdf_link_for_isbn(isbn:, expiration:)
      raise ArgumentError if expiration < 1.hour.from_now
      raise Hachette::BookNotFound if rand(10) == 1

      file_name = @editor == 'grasset' ? isbn : "#{isbn}.pdf"

      "https://#{@editor}.hachette.fr/pdf/#{expiration.to_i}-#{file_name}"
    end
  end
end
