# *Structure* represents the logical structure of the site. Actually it is a tree of all files and directories.
class Divber::Structure

  # TODO: Initialize
  def initialize
    @files = []
  end

  # TODO: Add files
  def << file
    @files << file
  end

  # (see Site#build)
  #
  # @param config (see Analyzer#initialize)
  def apply dest, config
    FileUtils.rm_rf dest
    FileUtils.mkpath dest
    @files.each_with_object dest, &:to
  end
end
