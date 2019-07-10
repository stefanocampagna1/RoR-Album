# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

configure :development do
  config[:protocol]      = 'http://'
  config[:host]          = '0.0.0.0'
  config[:port]          = 4567
  config[:css_dir]       = 'stylesheets'
  config[:js_dir]        = 'javascripts'
  config[:images_dir]    = 'images'
  config[:imgix_token]   = ENV['IMGIX_TOKEN']
  config[:imgix_domain]  = ENV['IMGIX_DOMAIN']
  config[:gravatar_email] = ENV['GRAVATAR_EMAIL']
  config[:environment]   = ENV['RACK_ENV']

  activate :gzip
  activate :dotenv
  activate :autoprefixer do |config|
    config.browsers = ['last 1 version', 'last 3 safari versions', 'last 3 ios versions']
  end
  activate :minify_html
end

configure :production do
  config[:protocol]      = 'https://'
  config[:host]          = 'www.gesteves.com/'
  config[:port]          = 80
  config[:css_dir]       = 'stylesheets'
  config[:js_dir]        = 'javascripts'
  config[:images_dir]    = 'images'
  config[:imgix_token]   = ENV['IMGIX_TOKEN']
  config[:imgix_domain]  = ENV['IMGIX_DOMAIN']
  config[:gravatar_email] = ENV['GRAVATAR_EMAIL']
  config[:environment]   = ENV['RACK_ENV']

  activate :gzip
  activate :dotenv
  activate :autoprefixer do |config|
    config.browsers = ['last 1 version', 'last 3 safari versions', 'last 3 ios versions']
  end
  activate :minify_css
  activate :minify_html
  activate :asset_hash
  activate :relative_assets

  caching_policy 'text/html',    s_maxage: ENV['MAX_AGE'] || 300, max_age: 0, public: true
  default_caching_policy         max_age: 60 * 60 * 24 * 365
end
