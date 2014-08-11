require File.expand_path('../lib/net/ssh/shell/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'ssh-shell'
  s.version       = Net::SSH::Shell::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Jamis Buck']
  s.email         = ['jamis@jamisbuck.org']
  s.homepage      = 'http://github.com/Xenapto/ssh-shell'
  s.summary       = 'A simple library to aid with stateful shell interactions'
  s.description   = 'A simple library to aid with stateful shell interactions'

  s.required_rubygems_version = '>= 1.3.6'
  s.add_dependency 'net-ssh', '~> 2'
  s.add_development_dependency 'rake'

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files`.split("\n").map { |f| f =~ /^bin\/(.*)/ ? Regexp.last_match[1] : nil }.compact
  s.require_path  = 'lib'
end
