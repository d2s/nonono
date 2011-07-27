# This file contains your application, it requires dependencies and necessary
# parts of the application.
#
# It will be required from either `config.ru` or `start.rb`

require 'rubygems'
require 'ramaze'

#require 'mustache'
require 'rdiscount'
require "compass"
require 'chronic'


# Make sure that Ramaze knows where you are
Ramaze.options.roots = [__DIR__]

# Compass CSS processing options
Compass.add_project_configuration("modules/compass/config.rb")


# Initialize controllers and models
require __DIR__('model/init')
require __DIR__('controller/init')


