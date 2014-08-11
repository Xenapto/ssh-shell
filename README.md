# Net::SSH::Shell

![Gem Version](http://img.shields.io/gem/v/foreplay.svg?style=flat)&nbsp;[![Code Climate](http://img.shields.io/codeclimate/github/Xenapto/foreplay.svg?style=flat)](https://codeclimate.com/github/Xenapto/foreplay)&nbsp;[![Coverage Status](https://img.shields.io/coveralls/Xenapto/foreplay.svg?style=flat)](https://coveralls.io/r/Xenapto/foreplay?branch=develop)
[![Developer status](http://img.shields.io/badge/developer-awesome-brightgreen.svg?style=flat)](http://xenapto.com)
![build status](https://circleci.com/gh/Xenapto/foreplay.png?circle-token=dd3a51864d33f6506b18a355bc901b90c0df3b3b)

## DESCRIPTION:

Net::SSH::Shell is a library for interacting with stateful (e.g., interactive) shells on remote hosts. It hides (or tries to hide) the potentially complex Net::SSH state machines you'd otherwise need to write to interact with "su" and similar shells.

One of the significant benefits you get from this library versus using Net::SSH directly is that your shell is _stateful_. With Net::SSH, if you invoke "cd /" in one exec call, and "pwd" in another, the two are done in different shells so the directory change in the first has no effect on the working directory of the second. With Net::SSH::Shell, though, commands are all invoked via the _same_ shell, so changes in directory or additions to the environment all affect subsequent commands.

## FEATURES:

* Interact with login shells
* Support for "subshell" environments, like "su" or "sudo bash"

## SYNOPSIS:

In a nutshell:

```ruby
require 'net/ssh'
require 'net/ssh/shell'

Net::SSH::start('host', 'user') do |ssh|
  ssh.shell do |sh|
    sh.execute "cd /usr/local"
    sh.execute "pwd"
    sh.execute "export FOO=bar"
    sh.execute "echo $FOO"
    p=sh.execute "grep dont /tmp/notexist"
    puts "Exit Status:#{p.exit_status}"
    puts "Command Executed:#{p.command}"
  end
end
```

See Net::SSH::Shell for more documentation.

## REQUIREMENTS:

* net-ssh (version 2)

If you want to use any of the Rake tasks, you'll need:

* Echoe (for the Rakefile)

## INSTALL:

This gem is available from RubyGems, so you can install it using the "gem" command:

* gem install net-ssh-shell

If you'd like to build the gem for yourself from source:
* `git clone http://github.com/Xenapto/ssh-shell.git`
* `cd ssh-shell`
* `gem install echoe`
* `rake gem`
* `gem install pkg/net-ssh-shell-0.1.0.gem` (might need sudo privileges)

## LICENSE:

(The MIT License)

Copyright (c) 2009 Jamis Buck <jamis@37signals.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
