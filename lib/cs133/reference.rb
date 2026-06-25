# frozen_string_literal: true

module Cs133
  module Reference
    GUIDE_PATH = File.expand_path("reference/guide.md", __dir__)

    def self.content
      File.read(GUIDE_PATH).strip
    end
  end
end
