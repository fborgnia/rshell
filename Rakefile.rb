require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'find'

# Don't include resource forks in tarballs on Mac OS X.
ENV['COPY_EXTENDED_ATTRIBUTES_DISABLE'] = 'true'
ENV['COPYFILE_DISABLE'] = 'true'

# Gemspec
gemspec = Gem::Specification.new do |s|
  s.rubyforge_project = 'rshell'

  s.name = 'rshell'
  s.version = '0.0.1'
  s.author = 'Fede Borgnia'
  s.email = 'fborgnia@gmail.com'
  s.homepage = 'https://github.com/fborgnia/rshell'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Ruby shell, manage your system with objects'

  #s.add_dependency 'gem', '>= version'

  s.files = FileList['lib/**/*', 'bin/*', 'LICENSE', 'README.md'].to_a
  s.executables |= Dir.entries('bin/')
  s.require_path = 'lib'
  s.has_rdoc = false

  s.required_ruby_version = '>= 1.9.3'
end

Gem::PackageTask.new gemspec do |p|
end

RDoc::Task.new do |rd|
  rd.main = 'rshell'
  rd.title = 'Ruby Shell'
  rd.rdoc_dir = 'doc'

  rd.rdoc_files.include('lib/**/*.rb')
end
