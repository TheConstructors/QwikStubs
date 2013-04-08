# QwikStubs 
[![Build Status](https://secure.travis-ci.org/TheConstructors/QwikStubs.png)](http://travis-ci.org/TheConstructors/QwikStubs)
[![Coverage Status](https://coveralls.io/repos/TheConstructors/QwikStubs/badge.png?branch=master)](https://coveralls.io/r/TheConstructors/QwikStubs)

## Branching 
If you are working on new code, you should always be working in a branch. The workflow should be: master is always stable,
development is where confirmed changes are commited and staged, and then branches for features. It should be 
`branch development -> new_feature`, then when the code has been reviewed then `merge new_feature -> development`.

## Code Reviews
We should be doing code reviews before commits. 

## Coding Style 
Look at the GitHub style guides, especially the Ruby one: https://github.com/styleguide/ruby. Checkout the other 
style guides also.

## Testing
* Rspec
* Guard
* Spork
* Travis-CI
* Coveralls

## Guard and Spork
To initiate the Spork server, monitored by Guard, you must first type

```
bundle exec guard
```