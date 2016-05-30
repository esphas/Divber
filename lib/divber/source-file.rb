# *SourceFile* represents the required files in the site
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
  def to source, dest
    type = :default
    FileUtils.mkpath File.expand_path(@path, dest)
    File.write File.expand_path(@fullname, dest), ERB.new(File.read(File.expand_path(@fullname, source))).result(Divber::ERBBinding.new(type).get_binding)
  end
end
