class EmailSender
  # This is a fake library for the purpose of the workshop.
  # Please consider that this is an external library: do not change this file.

  def deliver_later(_content, subject:, to:)
    Rails.logger.info("Sent email to #{to} with subject #{subject}.")
  end
end
