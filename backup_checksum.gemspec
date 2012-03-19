# encoding: utf-8

require File.expand_path('lib/backup/version')

Gem::Specification.new do |gem|

  ##
  # General configuration / information
  gem.name        = 'backup_checksum'
  gem.version     = Backup::Version.current
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = 'Lukasz Kaniowski'
  gem.email       = 'lukasz.kaniowski@gmail.com'
  gem.homepage    = 'http://rubygems.org/gems/backup_checksum'
  gem.summary     = 'It is a clone of http://rubygems.org/gems/backup with checksum added'

  ##
  # Files and folder that need to be compiled in to the Ruby Gem
  gem.files         = %x[git ls-files].split("\n")
  gem.test_files    = %x[git ls-files -- {spec}/*].split("\n")
  gem.require_path  = 'lib'

  ##
  # The Backup CLI executable
  gem.executables   = ['backup']

  ##
  # Gem dependencies
  gem.add_dependency 'thor',   ['~> 0.14.6']
  gem.add_dependency 'POpen4', ['~> 0.1.4']

end
