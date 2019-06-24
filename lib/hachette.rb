module Hachette
  # This is a fake library for the purpose of the workshop.
  # Please consider that this is an external library: do not change this file.

  class BookNotFound < StandardError
  end

  def self.editor(editor)
    Editor.new(editor)
  end
end
