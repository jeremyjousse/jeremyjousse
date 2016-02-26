###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
require 'lib/custom_helpers'
helpers CustomHelpers

configure :development do
  activate :livereload
end

activate :i18n,
         path: '/:locale/',
         lang_map: { en: :en, fr: :fr },
         mount_at_root: :en

activate :autoprefixer

activate :blog do |blog|
  # blog.prefix = 'posts'
  blog.sources = 'posts/{lang}/{year}-{month}-{day}-{title}.html'
  blog.permalink = 'blog/{year}-{month}-{day}-{title}.html'
  blog.default_extension = '.md'
  blog.layout = 'blog'

  blog.custom_collections = {
    category: {
      link: '/categories/{category}.html',
      template: 'localizable/categories.html'
    }
  }
end

require 'font-awesome-sass'

# activate :middleman_scavenger do |config|
#   config.path = './source/svg/'
#   config.prefix = 'icon-'
#   config.sprite_path = 'svg-sprite/sprite.svg'
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

configure :build do
  activate :asset_hash
  activate :minify_javascript
  activate :minify_css
  activate :gzip
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.build_before = true
end
