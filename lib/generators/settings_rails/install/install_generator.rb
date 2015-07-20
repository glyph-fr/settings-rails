module SettingsRails
  class InstallGenerator < Rails::Generators::Base
    desc "Install generator for the settings-rails gem"

    def copy_migrations
      rake 'settings_rails:install:migrations'
    end
  end
end
