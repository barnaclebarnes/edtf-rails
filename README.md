# Edtf-Rails
[![Build Status](https://travis-ci.org/masciugo/edtf-rails.svg?branch=master)](https://travis-ci.org/masciugo/edtf-rails)

An ActiveRecord extension to deal with Extended DateTime Format attributes

## Description
Edtf-Rails let ActiveRecord use the [Extended Date Time Format](http://www.loc.gov/standards/datetime) as type for attributes and is based on the gem [edtf-ruby](https://github.com/inukshuk/edtf-ruby) which is an EDTF implementation for Ruby. Basically, when writing the attribute an EDTF string is stored in the DB while, when reading, the EDTF string is parsed to return a Date. To do that, after a record is initialized, for each edtf attributes (*date_of_birth* for example), three virtual attributes for year, month and day are set (*date_of_birth_y*, *date_of_birth_m*, *date_of_birth_d*). Before validation those three virtual attributes are composed as a edtf date and assigned to the relative attribute.

## Installation
    gem install edtf-rails

## Usage
In your model specify which attributes must be treated as EDTF:

    edtf :attributes => [:date_of_birth, :date_of_death]

They needs to be of type string in the database. 

**NOTE: at db level edtf attributes will be treated as string while querying** 

## Test
To test compatibility with different versions of ActiveRecord [appraisal](https://github.com/thoughtbot/appraisal) was used

    appraisal rake
    
## Contributing

Comments and feedback are welcome

----
Copyright (c) 2014 masciugo. See LICENSE.txt for
further details.
