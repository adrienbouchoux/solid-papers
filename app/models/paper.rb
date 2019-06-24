class Paper < ApplicationRecord
  # This file breaks the SOLID principles. How would you refactor?

  def to_pdf
    HtmlToPdf.generate(
      to_html,
      file_name: pdf_name,
      margins: {top: '100px', left: '50px', right: '50px', bottom: '100px'},
      tags: %w[paper]
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
    "paper-#{id}-#{title.parameterize}"
  end

  def pdf_name
    "#{url_name}.pdf"
  end

  def send_to_s3
    S3.get_bucket('papers').create_file(pdf_name, to_pdf)
  end

  def send_in_email(email)
    EmailSender.deliver_later(to_html, subject: "[Paper #{title}]", to: email)
  end
end
