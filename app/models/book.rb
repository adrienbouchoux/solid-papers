class Book < ApplicationRecord
  # This file breaks the SOLID principles. How would you refactor?

  def url_name
    "book-#{id}-#{title.parameterize}"
  end

  def pdf_url
    case editor
    when 'seuil'
      Seuil.get_book(isbn: isbn).get_ebook_url(format: :pdf, expires_in: 50.minutes.from_now)
    when 'flammarion'
      Flammarion::Book.find(isbn).metadata[:pdf_url]
    when 'hachette', 'grasset', 'fayard'
      link = Hachette.editor(editor).pdf_link_for_isbn(isbn: isbn, expiration: 2.hours.from_now)

      # The lib is buggy when the editor is grasset
      editor == 'grasset' ? "#{link}.pdf" : link
    end
  rescue Hachette::BookNotFound
    nil
  end
end
