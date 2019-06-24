class Seuil
  class Book
    # This is a fake library for the purpose of the workshop.
    # Please consider that this is an external library: do not change this file.

    def initialize(isbn)
      @isbn = isbn
    end

    # This method implements a very complex algorithm.
    # Obviously, it is so complex that we don't want to implement it ourselves!
    def get_ebook_url(format: :epub, expires_in:)
      raise ArgumentError unless expires_in && expires_in < 1.hour

      "https://seuil.fr/#{isbn}.#{format}?expires_at=#{expires_in.from_now.to_i}"
    end
  end
end
