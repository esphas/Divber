# *Structure* represents the Divber::Logical structure of the site.
class Divber::Structure

  # Initialize
  def initialize
    @files = []
  end

  # (see Site#build)
  #
  # @param config (see Analyzer#initialize)
  def apply dest, config
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ dest.inspect }, #{ config.inspect }"
    FileUtils.rm_rf dest
    FileUtils.mkpath dest
    @files.each do |file|
      file.to dest, config
    end
  end

  # Append source files
  #
  # @param filename (see Analyzer#ignored_file?)
  def source filename
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ filename.inspect }"
    @files.push Divber::SourceFile.new filename
  end

  # Append binary files
  #
  # @param filename (see Analyzer#ignored_file?)
  def binary filename
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ filename.inspect }"
    @files.push Divber::BinaryFile.new filename
  end
end
