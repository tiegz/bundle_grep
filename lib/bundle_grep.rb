require "open3"
require "bundle_grep/version"
require "bundler/cli/list"

class BundleGrep < Bundler::Plugin::API
  # Register this class as a handler for the `bundle_grep` command
  command "grep"

  def exec(command, args)
    puts "You called " + command + " with args: " + args.inspect
    # TODO: could just shell out to `bundle list --paths` instead?
    paths = with_captured_stdout {
      Bundler::CLI::List.new("paths" => true).run
    }.lines.map(&:strip)
    cmd = "grep --color -r #{args.join(' ')} #{paths.join(' ')}"
    # puts "Cmd is #{cmd}"
    system(cmd)
  end

  private def with_captured_stdout
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = original_stdout
  end
end


# foo = StringIO.new
# $stdout = foo

# # Send some text to $stdout.
# puts 'hi'
# puts 'bye'

# # Access the data written to standard output.
# $stdout.string
# # => "hi\nbye\n"

# # Send your captured output to the original output stream.
# STDOUT.puts $stdout.string
