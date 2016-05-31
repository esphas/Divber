# *Page* represents the web page in the site
class Divber::Site::Page

  #
  def initialize yaml
    @yaml = yaml
  end

  #
  def [] key
    @yaml[key]
  end
end
