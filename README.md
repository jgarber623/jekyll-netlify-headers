# jekyll-netlify-headers

**A Ruby gem for generating a [Netlify](https://www.netlify.com) headers configuration from a [Jekyll](https://jekyllrb.com) configuration.**

[![Gem](https://img.shields.io/gem/v/jekyll-netlify-headers.svg?style=for-the-badge)](https://rubygems.org/gems/jekyll-netlify-headers)
[![Downloads](https://img.shields.io/gem/dt/jekyll-netlify-headers.svg?style=for-the-badge)](https://rubygems.org/gems/jekyll-netlify-headers)

Netlify's HTTP headers configuration is _quite_ powerful. Netlify provides two options for configuring your Netlify-deployed website's rules: either in [a `netlify.toml` file](https://www.netlify.com/docs/netlify-toml-reference/) or in [a `_headers` file](https://www.netlify.com/docs/headers-and-basic-auth/).

Both file formats are perfectly serviceable, but if you're anything like me, you prefer fewer configuration files cluttering up your project. jekyll-netlify-headers allows you to configure your Netlify-deployed website's HTTP headers configuration using your project's existing Jekyll configuration file.

## Getting Started

Before installing and using jekyll-netlify-headers, you'll want to familiarize yourself with [Jekyll](https://jekyllrb.com) (a fabulous static site generator written in [Ruby](https://www.ruby-lang.org)) and [Netlify](https://www.netlify.com) (a fabulous website hosting service). In particular, you'll want to read up on Netlify's [Headers and Basic Authentication documentation](https://www.netlify.com/docs/headers-and-basic-auth/).

## Installation

If you're using [Bundler](https://bundler.io), add jekyll-netlify-headers to your project's `Gemfile`:

```rb
source 'https://rubygems.org'

group :jekyll_plugins do
  gem 'jekyll-netlify-headers'
end
```

…and hop over to your command prompt and run…

```sh
$ bundle install
```

## Usage

With jekyll-netlify-headers added to your project's `Gemfile` and installed, add the following to your [Jekyll configuration file](https://jekyllrb.com/docs/configuration/) (typically `_config.yml`):

```yaml
netlify:
  headers:
    - paths:
        - /templates/index.html
      headers:
        - "X-Frame-Options: DENY"
        - "X-XSS-Protection: 1; mode=block"
    - paths:
        - /templates/index2.html
        - /templates/index3.html
      headers:
        - "X-Frame-Options: SAMEORIGIN"
```

**Note:** Netlify supports a variety of HTTP header configuration options, so comb through their [Headers and Basic Authentication documentation](https://www.netlify.com/docs/headers-and-basic-auth/) for more on the syntax. You may also want to test your HTTP header configuration at [Netlify's Playground](https://play.netlify.com/headers).

With this configuration added to `_config.yml` (or to your custom Jekyll configuration file), Jekyll will generate a properly-formatted `_headers` file in the destination directory when building your project.

The example above will yield a `_headers` file that looks like:

```txt
/templates/index.html
  X-Frame-Options: DENY
  X-XSS-Protection: 1; mode=block
/templates/index2.html
  X-Frame-Options: SAMEORIGIN
/templates/index3.html
  X-Frame-Options: SAMEORIGIN
```

## Improving jekyll-netlify-headers

Want to help make jekyll-netlify-headers better? Hell yeah! I like your enthusiasm. For more on how you can help, check out [CONTRIBUTING.md](https://github.com/jgarber623/jekyll-netlify-headers/blob/master/CONTRIBUTING.md).

### Donations

If diving into Ruby isn't your thing, but you'd still like to support jekyll-netlify-headers, consider making a donation! Any amount—large or small—is greatly appreciated. As a token of my gratitude, I'll add your name to the [Acknowledgments](#acknowledgments) below.

[![Donate via Square Cash](https://img.shields.io/badge/square%20cash-$jgarber-28c101.svg?style=for-the-badge)](https://cash.me/$jgarber)
[![Donate via Paypal](https://img.shields.io/badge/paypal-jgarber-009cde.svg?style=for-the-badge)](https://www.paypal.me/jgarber)

## Acknowledgments

jekyll-netlify-headers wouldn't exist without the hard work of all the folks involved in designing, building, and maintaining Jekyll and Netlify. High fives, y'all. 🙌🏻

jekyll-netlify-headers is written and maintained by [Jason Garber](https://sixtwothree.org).

## License

jekyll-netlify-headers is freely available under the [MIT License](https://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
