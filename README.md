# Edtf-Rails
[![Build Status](https://travis-ci.org/masciugo/edtf-rails.svg?branch=master)](https://travis-ci.org/masciugo/edtf-rails)

An ActiveRecord extension to deal with Extended DateTime Format attributes

## Description
Edtf-Rails let ActiveRecord use the [Extended Date Time Format](http://www.loc.gov/standards/datetime) and is based on the gem [edtf-ruby](https://github.com/inukshuk/edtf-ruby) which is an EDTF implementation for Ruby.

## Installation
    gem install edtf-rails

## Usage
In your model specify which attributes must be treated as EDTF:

    edtf :attributes => [:date_of_birth, :date_of_death]

They needs to be of type string in the database.

## Test
To test compatibility with different versions of ActiveRecord [appraisal](https://github.com/thoughtbot/appraisal) was used

    appraisal rake
    
## Contributing

Comments and feedback are welcome

----
Copyright (c) 2014 masciugo. See LICENSE.txt for
further details.
