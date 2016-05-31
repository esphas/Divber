# *ERBParser* parses file contents.
class Divber::ERBParser

  attr_reader :page, :site

  #
  def initialize yaml, config, content
    @content = content
    @page = Divber::Site::Page.new yaml
    @site = Divber::Site::Site.new config
  end

  #
  def result
    content = ERB.new(@content).result binding
    if page['layout'] && __layout__ = Dir[File.expand_path(page['layout'] + '.*', File.expand_path(site['layout_dir'], site['source']))][0]
      Divber::Log.debug "  layout: #{ __layout__ }"
      ERB.new(File.read(__layout__)).result binding
    else
      content
    end
  end
end
