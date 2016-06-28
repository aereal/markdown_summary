module MarkdownSummary
  Settings = Struct.new(
    :ignored_files,
    :root,
    :pattern
  )
  class << Settings
    def merge(*settings)
      self.new.tap do |merged|
        self.members.each do |member|
          merged[member] = (settings.find {|s| s[member] } || merged)[member]
        end
      end
    end

    def from(**hash)
      self.new(*self.members.map {|m| hash[m] })
    end
  end

  DefaultSettings = Settings.from(
    ignored_files: [],
    root: '.',
    pattern: '**/*.{md,markdown}',
  )

  autoload :Collector, 'markdown_summary/collector'
  autoload :Document, 'markdown_summary/document'
  autoload :Formatter, 'markdown_summary/formatter'
  autoload :Generator, 'markdown_summary/generator'
end
