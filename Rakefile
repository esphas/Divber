
desc 'Default Tasks'
task :default => :build

desc 'Build Divber Site'
task :build => :test do
  sh 'divber', 'build', 'site', '-d', 'divber_site'
end

desc 'Test'
task :test do
  sh 'rm -rf test/*'
  # Initialize site in a location that does not exist
  sh 'divber', 'new', 'test/site'
  # Initialize site in a existing site path(Expecting abortion)
  begin
    sh 'divber', 'new', 'test/site'
    raise Exception, 'Expecting Abortion!'
  rescue RuntimeError
  end
  # Build empty site
  sh 'divber', 'build', 'test/site', '-d', 'test/site_product'
  # Initialize site in a site product
  sh 'divber', 'new', 'test/site_product'
  # Build on a re-initialized site product
  sh 'divber', 'build', 'test/site_product'
end
