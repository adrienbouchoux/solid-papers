module Seuil
  # This is a fake library for the purpose of the workshop.
  # Please consider that this is an external library: do not change this file.

  # This method implements a very complex algorithm.
  # Obviously, it is so complex that we don't want to implement it ourselves!
  def self.get_book(isbn:)
    Seuil::Book.new(isbn)
  end
end
