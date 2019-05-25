require "open3"
require "bundle_grep/version"
require "bundler/cli/list"

class BundleGrep
  # Register this class as a handler for the `bundle_grep` command
  command "grep"

  def exec(command, args)
    # TODO: could just shell out to `bundle list --paths` instead?
    paths = with_captured_stdout {
      Bundler::CLI::List.new("paths" => true).run
    }.lines.map(&:strip)
    cmd = "grep --color -r #{args.join(' ')} #{paths.join(' ')}"
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
