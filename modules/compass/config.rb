# Originally from https://github.com/chriseppstein/compass/wiki/Ramaze-Integration

engine :Sass
Compass.configuration do |config|
  config.project_path = File.join(File.dirname(__FILE__), "..")
  config.css_dir = "public/css"
  config.sass_dir = "style/"
  config.images_dir = "public/img"
  config.http_path = "/"
  config.http_images_path ="/img"
  config.http_stylesheets_path = "/css"
  config.http_javascripts_path = "/js/mylibs"
  config.output_style = :compact
end
trait[:sass_options] = Compass.configuration.to_sass_engine_options
