# *Site* represents the web site
class Divber::Site::Site

  #
  def initialize config
    @config = config
  end

  #
  def [] key
    @config[key]
  end
end
