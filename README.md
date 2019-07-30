# JekyllPush :octocat:

[![Build Status](https://travis-ci.org/mnyrop/jekyll_push.svg?branch=master)](https://travis-ci.org/mnyrop/jekyll_push) [![Gem Version](https://badge.fury.io/rb/jekyll_push.svg)](https://badge.fury.io/rb/jekyll_push) [![Gem Downloads](https://img.shields.io/gem/dt/jekyll_push.svg?color=046d0b)](https://badge.fury.io/rb/jekyll_push) [![Maintainability](https://api.codeclimate.com/v1/badges/25dfeec93e298350ce50/maintainability)](https://codeclimate.com/github/mnyrop/jekyll_push/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/25dfeec93e298350ce50/test_coverage)](https://codeclimate.com/github/mnyrop/jekyll_push/test_coverage) [![docs](http://img.shields.io/badge/docs-rdoc.info-blue.svg?style=flat)](https://www.rubydoc.info/github/mnyrop/jekyll_push/)  ![License](https://img.shields.io/github/license/mnyrop/jekyll_push.svg?color=c6a1e0) 

__Jekyll gem plugin to push a compiled Jekyll site to a GitHub branch.__ Works locally or on Travis CI if you add an access token to your Travis build. Great for keeping archived copies or getting to use Jekyll Plugins and still host on GitHub pages.

![push pop gif](https://media1.giphy.com/media/RI41Y0H0osVYQ/giphy.gif)
 

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

For example, if you have a repository named `my_site` just add:

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
