# BundleGrep

A [Bundler Plugin](https://bundler.io/v2.0/guides/bundler_plugins.html) that greps your bundled Ruby gems.

## Installation

Add this line to your application's Gemfile:

```ruby
plugin 'bundle_grep' # Installs from Rubygems
```

Or, install manually:

    $ bundler plugin install bundle_grep

And then execute:

```sh
$ bundle grep spec.license
$ .../somelibrary/somelibrary.gemspec:  spec.license       = "MIT"
```

## Uninstallation

Bundler currently doesn't have a `bundler plugin uninstall ...` command, but you can reset your local plugins with a simple `rm -rf .bundle/plugin`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tiegz/bundle_grep. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BundleGrep project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tiegz/bundle_grep/blob/master/CODE_OF_CONDUCT.md).
