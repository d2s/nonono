require 'rubygems'
require 'ramaze'

class MainController < Ramaze::Controller
  engine :Mustache
  
  def index
    @home     = a('Home',:/)
    @internal = a(:internal)
    @external = a(:external)

    %{ {{{home}}} | {{{internal}}} | {{{external}}} }
  end

  def internal(*args)
    set_mustache_variables(:internal, *args)
  end

  def external *args
    set_mustache_variables(:external, *args)
  end

  private

  def set_mustache_variables(place, *args)
    @header     = "The #{place} Template for Mustache"
    @link_home  = a('Home', :/)
    @link_one   = a("#{place}/one")
    @link_two   = a("#{place}/one/two/three")
    @link_three = a("#{place}?foo=Bar")
    @args       = args.map { |arg| {:arg => arg} }
    @args_empty = args.empty?
    @not_empty  = !@args_empty
    @params     = request.params.inspect
  end
end

Ramaze.start :file => __FILE__
