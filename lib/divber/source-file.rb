# *SourceFile* represents the required source files in the site
class Divber::SourceFile

  # Initialize
  #
  # @param filename (see Analyzer#ignored_file?)
  def initialize filename
    @fullname = filename
    @path = File.dirname filename
    @name = File.basename filename
  end

  # Generate files
  #
  # @param config (see Analyzer#initialize)
  # @param TODO
  def to dest, config
    Divber::Log.debug "#{ self.class }##{ __callee__ }: #{ dest }/#{ @fullname }"
    content = File.read File.expand_path(@fullname, config['source'])
    yaml = YAML.load(content) || {}
    content.gsub! /\A---.*?(?:\.\.\.|---)\n/m, ''
    FileUtils.mkpath File.expand_path(@path, dest)
    File.write File.expand_path(@fullname, dest), Divber::ERBParser.new(yaml, config, content).result
  end
end
