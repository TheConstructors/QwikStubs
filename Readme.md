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

## Sunspot (Solr) Configuration
First, you need to start the Sunspot:Solr server to be running in the background. 
This can be performed with the ```bundle exec rake sunspot:solr:start``` command. 
Then, if you have not indexed before, or you perform a ```bundle exec rake db:seed```, 
then you need to also perform a ```bundle exec rake sunspot:reindex```.

## Simulator 
For now you can simply run the simulator with: `ruby simulator.rb event-id seat-amount`.

