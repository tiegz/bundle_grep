require "bundle_grep/version"

class BundleGrep < Bundler::Plugin::API
  # Register this class as a handler for the `my_command` command
  command "grep"

  # The exec method will be called with the `command` and the `args`.
  # This is where you should handle all logic and functionality
  def exec(command, args)
    puts "You called " + command + " with args: " + args.inspect
  end
end

