module MarkdownSummary
  class Formatter
    def initialize(root: , document:)
      @root = root
      @document = document
    end

    def formatted_string
      "  * [#{@document.title}](#{@document.path.relative_path_from(@root)})"
    end
  end
end
