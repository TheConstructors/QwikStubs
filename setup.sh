#!/bin/sh
rake db:seed
rake sunspot:solr:reindex
