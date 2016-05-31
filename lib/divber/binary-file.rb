# *BinaryFile* represents the required binary files in the site
class Divber::BinaryFile < Divber::SourceFile

  def to dest, config
    Divber::Log.debug "#{ self.class }##{ __callee__ }: #{ dest }/#{ @fullname }"
    FileUtils.mkpath File.expand_path(@path, dest)
    FileUtils.cp File.expand_path(@fullname, config['source']), File.expand_path(@fullname, dest)
  end
end
