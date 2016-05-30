# *Structure* represents the Divber::Logical structure of the site.
class Divber::Structure

  # Initialize
  def initialize
    @files = []
  end

  # (see Site#build)
  #
  # @param config (see Analyzer#initialize)
  def apply source, dest, config
    Divber::Log.info "#{ self.class }##{ __callee__ } #{ source.inspect }, #{ dest.inspect }, #{ config.inspect }"
    FileUtils.rm_rf dest
    FileUtils.mkpath dest
    @files.each do |file|
      file.to source, dest
    end
  end

  # Append files
  #
  # @param filename (see Analyzer#ignored_file?)
  def append filename
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ filename.inspect }"
    @files.push Divber::SourceFile.new(filename)
  end
end
