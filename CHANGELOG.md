## 0.3.0 (unreleased)

  - Loosen dependency on net-ssh version

## 0.2.0 (June 13, 2011)

  - Loosen regex on `on_stdout` [GH-1]
  - Capture stderr from shell. This won't capture the stderr of the processes
    running. Instead it will just capture any error output from the shell process.
  - Ability to specify the default process class to use for `Shell#execute`

## 0.1.0 (October 24, 2010)

  - Initial release
