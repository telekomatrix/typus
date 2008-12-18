require 'typus'
require 'sha1'

##
# Load paths. (This will be the first thing I'll remove once 
# Rails 2.3/3 is released.)
#

ActionController::Base.append_view_path(File.join(File.dirname(__FILE__), 'app', 'views'))

%w( models controllers helpers ).each do |folder|
  ActiveSupport::Dependencies.load_paths << File.join(File.dirname(__FILE__), 'app', folder)
end

##
# Load Translations
#
I18n.load_path += Dir[File.join(RAILS_ROOT, 'vendor/plugins/typus/config/locales', '*.{rb,yml}')]

##
# Typus.enable and run the generator unless we are testing the plugin.
# Do not Typus.enable or generate files if we are running a rails 
# generator.
#

scripts = %w( script/generate script/destroy )

unless scripts.include?($0)
  Typus.enable
  Typus.generator unless Rails.env.test?
end