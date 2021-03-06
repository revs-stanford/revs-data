
activate :i18n, :mount_at_root => :en
activate :livereload
activate :directory_indexes

set :trailing_slash, true
set :markdown_engine, :kramdown
set :markdown, :layout_engine => :slim,
  tables: true,
  coderay_line_numbers: nil

## site specific stuff
set :site_title, 'REVS Data'
set :site_description, "REVS car data"
set :typekit_id, 'bwq4gyt' #'deu1taf'
# set :google_analytics_id, 'UA-55019978-1'


# Slim configuration
set :slim, {
  :format  => :html5,
  :indent => '    ',
  :pretty => true,
  :sort_attrs => false
}
::Slim::Engine.set_default_options lang: I18n.locale, locals: {}

# Compass configuration
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :files_dir, 'assets/files'

activate :blog do |blog|
  blog.name = "blog"
  blog.prefix = "blog"
  blog.permalink = "{title}"
  blog.layout = "blog"
  blog.publish_future_dated = true
  blog.summary_separator = /SPLIT_SUMMARY_BEFORE_THIS/
end



# Build-specific configuration
configure :build do


  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

ready do
  # Add bower's directory to sprockets asset path
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]


end
