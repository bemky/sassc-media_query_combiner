# SassC::MediaQueryCombiner

Combines all matching media queries while compiling your SassC.

For example:

```css
h3 {
  color: orange
}
@media (max-width: 480px) {
  h1 {
    color: red
  }
}
@media (max-width: 980px) {
  h4 {
    color: black
  }
}
@media (max-width: 480px) {
  h2 {
    color: blue
  }
}
```

Would end up as (except the whitespace won't be so clean):

```css
h3 {
  color: orange
}
@media (max-width: 480px) {
  h1 {
    color: red
  }
  h2 {
    color: blue
  }
}
@media (max-width: 980px) {
  h4 {
    color: black
  }
}
```

### Note

**This will change the order of your css, so be aware of that.** All the
`@media` queries will end up at the end of each css file in the order that
they are first encountered. In other words, if you're relying on only using
min-width or only using max-width in a specific order you'll want to be sure
define your media queries in the right order up front before you use them
randomly throughout your file.

## Installation

Requires Ruby >= 1.9.2.

Add this line to your application's Gemfile:

    gem 'sassc-media_query_combiner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sassc-media_query_combiner

## Usage

In your `config.rb`

```ruby
require 'sassc-media_query_combiner'
```

If you're using `sassc --watch` do:

```bash
sassc --watch -r sassc-media_query_combiner
```

