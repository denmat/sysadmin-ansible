require 'rake'
require 'rspec/core/rake_task'

task :spec    => 'spec:all'
task :default => :spec

namespace :docker do
  desc 'build docker image'
  task :build do
    %x[docker build --tag denmat/apache2 .]
  end

  desc 'run docker image'
  task :run do
    %x[docker run --name book_apache2 -p 8081:80 denmat/apache2]
  end

  desc 'clean up image'
  task :clean do
    %x[docker kill book_apache2]
    %x[docker rm book_apache2]
  end
end
namespace :spec do
  targets = []
  Dir.glob('./spec/*').each do |dir|
    next unless File.directory?(dir)
    target = File.basename(dir)
    target = "_#{target}" if target == "default"
    targets << target
  end

  task :all     => targets
  task :default => :all

  targets.each do |target|
    original_target = target == "_default" ? target[1..-1] : target
    desc "Run serverspec tests to #{original_target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['TARGET_HOST'] = original_target
      t.pattern = "spec/#{original_target}/*_spec.rb"
    end
  end
end


