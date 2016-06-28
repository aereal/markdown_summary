require 'pathname'

module MarkdownSummary
  class Collector
    def initialize(root: , pattern: , ignored_files: [])
      @root = root
      @pattern = pattern
      @ignored_files = ignored_files
    end

    def collect
      globbed_files = Pathname.glob(@root + @pattern)
      globbed_files.reject {|f| @ignored_files.include?(f.to_s) }
    end
  end
end
