# *ERBBinding* represents the required bindings
class Divber::ERBBinding

  module Default

    #
    def page
      Divber::Site::Page.new
    end

    #
    def content
      page.content
    end
  end

  module Index
  end

  module Article
  end

  #
  def initialize type
    self.singleton_class.send :include, Default
    return unless mod = case type
    when :index
      Index
    when :article
      Article
    end
    self.singleton_class.send :include, mod
  end

  #
  def get_binding
    send :binding
  end
end
