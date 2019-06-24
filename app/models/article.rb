class Article < ApplicationRecord
  # This file breaks the SOLID principles. How would you refactor?

  def to_pdf
    HtmlToPdf.generate(
      to_html,
      file_name: pdf_name,
      margins: {top: '100px', left: '100px', right: '100px', bottom: '100px'},
      tags: %w[article]
    )
  end

  def to_html
    "<h1>#{title}</h1><div class=\"content\">#{content}</div>"
  end

  def archive!
    send_to_s3
    update(archived_at: Time.zone.now)
  end

  def url_name
    "article-#{id}-#{title.parameterize}"
  end

  def pdf_name
    "#{url_name}.pdf"
  end

  def send_to_s3
    S3.get_bucket('articles').create_file(pdf_name, to_pdf)
  end
end
