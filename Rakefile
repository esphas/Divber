
task :default => :test

multitask :test => %w[ hello_world test_new test_build ]

task :hello_world do
  ruby 'test/hello_world.rb'
end

task :test_new do
  sh 'divber', 'new'
end

task :test_build do
  sh 'divber', 'build'
end
