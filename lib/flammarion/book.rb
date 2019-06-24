module Flammarion
  class Book
    # This is a fake library for the purpose of the workshop.
    # Please consider that this is an external library: do not change this file.

    def self.find(isbn)
      new(isbn: isbn)
    end

    def initialize(isbn: isbn)
      @isbn = isbn
    end

    # This method implements a very complex algorithm.
    # Obviously, it is so complex that we don't want to implement it ourselves!
    def metadata
      {
        isb: @isbn,
        pdf_url: "https://flammarion.fr/pdf/#{@isbn.reverse}.pdf"
      }
    end
  end
end
