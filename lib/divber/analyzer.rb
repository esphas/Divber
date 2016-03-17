# *Analizer* analizes the source site and outputs the action that should be performed on specific files.
class Divber::Analyzer

  # initialize with the root path of the source site.
  #
  # @param root [String] the root path of the source site
  # @param config [Configuration] the Configuration
  def initialize root, config
    @root = root
    @config = config
  end

  # (see Site#analyze)
  def analyze
    structure = Divber::Structure.new
    Dir['**/*'].each do |filename|
      next if FileTest.directory? filename
      if source_file? filename
        structure << ::Divber::SourceFile.new filename
      elsif not ignored_file? filename
        structure << ::Divber::StaticFile.new filename
      end
    end
    structure
  end

  # TODO: examine source files
  def source_file? filename
  end

  # TODO: examine ignored files
  def ignored_file? filename
  end
end
