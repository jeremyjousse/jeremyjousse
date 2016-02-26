page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

require 'lib/custom_helpers'
helpers CustomHelpers

configure :development do
  activate :livereload
end

activate :i18n,
         path: '/:locale/',
         lang_map: { en: :en, fr: :fr },
         mount_at_root: :en,
         langs: [:en, :fr]

activate :autoprefixer

set :haml, ugly: true, format: :html5

activate :blog do |blog|
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

configure :build do
  ignore 'readme.md'
  activate :asset_hash
  activate :minify_javascript
  activate :minify_css
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.build_before = true
end
