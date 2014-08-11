require 'net/ssh/shell/process'

class Net::SSH::Shell
  class Subshell < Process
    protected

    def on_stdout(ch, data)
      return if output!(data)
      ch.on_data(&method(:look_for_finalize_initializer))
      ch.send_data("export PS1=; echo #{manager.separator} $?\n")
    end

    def look_for_finalize_initializer(ch, data)
      return unless data =~ /#{manager.separator} (\d+)/
      ch.on_close(&@master_onclose)
      finished!(Regexp.last_match[1])
    end
  end
end
