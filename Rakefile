require 'fileutils'

desc 'Default Tasks'
task :default => :build

desc 'Publish gem to rubygems.org'
task :publish => :build do
  sh 'gem', 'push', 'divber-*.gem'
end

desc 'Build gem'
task :build => :test do
  sh 'gem', 'build', 'divber.gemspec'
end

desc 'Build Divber Site'
task :site => :test do
  sh 'divber', 'build', 'site', '-d', 'divber_site'
end

desc 'Test'
task :test => :clean do
  puts 'Testing...'
  sh 'rm -rf test'
  sh 'mkdir test'
  # Initialize site in a location that does not exist
  sh 'divber', 'new', 'test/site'
  # Initialize site in a existing site path(Expecting abortion)
  begin
    sh 'divber', 'new', 'test/site'
    raise Exception, 'Expecting Abortion!'
  rescue RuntimeError
  end
  # Override
  sh 'divber', 'new', '-o', 'test/site'
  sh 'rm -rf test/*'
  sh 'cp -R site test/site'
  # Build empty site
  sh 'divber', 'build', 'test/site', '-d', 'test/site_product'
  puts 'Done!'
end

desc 'Clean'
task :clean do
  files = Dir['*'] - %w! Gemfile LICENSE README.md Rakefile bin divber.gemspec lib site !
  puts 'Cleaning...', *files
  FileUtils.rm_rf files
  puts 'Done!'
end
