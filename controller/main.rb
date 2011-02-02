# Default url mappings are:
#  a controller called Main is mapped on the root of the site: /
#  a controller called Something is mapped on: /something
# If you want to override this, add a line like this inside the class
#  map '/otherurl'
# this will force the controller to be mounted on: /otherurl



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

    %q{
<html>
  <head>
    <title>Template::Mustache internal</title>
  </head>
  <body>
  <h1>{{header}}</h1>
    {{{link_home}}}
    <p>
      Here you can pass some stuff if you like, parameters are just passed like this:<br />
      {{{link_one}}}<br />
      {{{link_two}}}<br />
      {{{link_three}}}
    </p>
    <div>
      The arguments you have passed to this action are:
      {{#args_empty}}
        none
      {{/args_empty}}
      {{#not_empty}}
        {{#args}}
          <span>{{arg}}</span>
        {{/args}}
      {{/not_empty}}
    </div>
    <div>
      {{params}}
    </div>
  </body>
</html>
    }
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



# class MainController < Controller
  # the index action is called automatically when no other action is specified
#   def index
#     @title = "nonono"
#   end
# 
  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
#   def notemplate
#     "there is no 'notemplate.xhtml' associated with this action"
#   end
# end
# 
# 
# class Contact < Ramaze::Controller
#   map '/contact'
# 
  # http://localhost:7000/contact/hello
#   def hello
#     "Hello from Another!"
#   end
# end
# 
# class Feed < Ramaze::Controller
#   map '/feed'
#   
#   def minimal
#     "Minimalist Feed!"
#   end
# end
# 
# 
# 
# 
# class SimpleController < Ramaze::Controller
#   map '/mini'
# 
  # - simple text-output from the controller    [ /mini/simple ]
  # - showing you what your request looked like [ /mini/simple ]
#   def index
#     "simple"
#   end
#   
  # - joining two strings                       [ /mini/join/string1/string2 ]
#   def join(first, second)
#     [first, second].join
#   end
# 
  # - join arbitary strings                     [ /mini/join_all/string1/string2/string3 ... ]
#   def join_all *strings
#     strings.join
#   end
# 
  # - sum two numbers                           [ /mini/sum/1/3 ]
#   def sum first, second
#     "#{first.to_i + second.to_i}"
#   end
# 
  # - show if you made a POST or GET request    [ /mini/post_or_get ]
#   def post_or_get
#     request.request_method
#   end
# end
# 
# class OtherController < Ramaze::Controller
  # - How to map your controllers to urls       [ /mini/other ]
#   map '/other'
# 
#   def index
#     "Hello, World from #{self.class.name}"
#   end
#   
  # - Also try out the error-page, just pass something odd ;)
# end
