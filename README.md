# JekyllPush [![Build Status](https://travis-ci.org/mnyrop/jekyll_push.svg?branch=master)](https://travis-ci.org/mnyrop/jekyll_push)
Jekyll gem plugin to push a compiled site to a GitHub branch. Works locally or on Travis CI if you add an access token.  


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll_push'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll_push

## Usage

`$ jekyll push <branch_name>` or `$ bundle exec jekyll push <branch_name>`

## Configuration

If you run `jekyll push gh-pages` to use __GitHub pages publishing__, `JekyllPush` will look for a `repo_name` variable in your `_config.yml` file and try to construct a `baseurl` from it.

For example, if you have a repository named `my_site` just add

```yaml
repo_name: my_site
```

to your `_config.yml` file and `JekyllPush` will rebuild your site using `/my_site` as the `baseurl` before pushing it to the `gh-pages` branch. This lets you use `JekyllPush` for multiple branches and publish targets, with differing (base)url patterns.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mnyrop/jekyll_push. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the JekyllPush project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mnyrop/jekyll_push/blob/master/CODE_OF_CONDUCT.md).
