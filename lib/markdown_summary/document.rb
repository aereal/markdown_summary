module MarkdownSummary
  class Document
    HEADING_PATTERN = /\A#[^#]/.freeze

    def initialize(path)
      @path = path # Pathname
    end

    attr_reader :path

    def title
      @title ||=
        begin
          maybe_title = @path.each_line.find {|line| HEADING_PATTERN === line }
          return nil unless maybe_title
          maybe_title.strip.sub(/\A#+\s*/, '')
        end
    end
  end
end
