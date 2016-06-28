require 'pathname'

module MarkdownSummary
  class Generator
    def initialize(settings)
      @settings = settings
    end

    attr_reader :settings

    def generate
      root = Pathname.new(settings.root).expand_path
      files = MarkdownSummary::Collector.new(
        root: root,
        pattern: settings.pattern,
        ignored_files: settings.ignored_files
      ).collect
      documents = files.map {|f| MarkdownSummary::Document.new(f) }
      summaries = documents.map {|doc|
        MarkdownSummary::Formatter.new(root: root, document: doc).formatted_string
      }
      puts summaries
    end
  end
end
