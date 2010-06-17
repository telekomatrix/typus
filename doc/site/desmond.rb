##
# $ rails new desmond -m http://github.com/fesplugas/typus/raw/3-0-unstable/doc/site/desmond.rb
##

plugin "typus", :git => "git://github.com/fesplugas/typus.git", :branch => "3-0-unstable"
plugin "typus_cms", :git => "git@trunksapp.com:fesplugas/typus_cms.git"
plugin "typus_settings", :git => "git@trunksapp.com:fesplugas/typus_settings.git"

##
# Install useful plugins
##

plugin "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
plugin "acts_as_list", :git => "git://github.com/rails/acts_as_list.git"
plugin "acts_as_tree", :git => "git://github.com/rails/acts_as_tree.git"

##
# Run typus generators
##

generate "typus"
generate "typus_migration"
generate "typus_cms_migration"
generate "typus_settings_migration"

# Migrate the database!

rake "db:migrate"
