module SettingsRails
  class Form
    include ActiveModel::Model

    def settings
      dirty_settings.values
    end

    def dirty_settings
      @dirty_settings ||= {}
    end

    def settings_attributes=(params)
      params.each do |_, attributes|
        setting = Settings.get(attributes[:key], attributes[:_type])
        setting.assign_attributes(attributes)

        dirty_settings[setting.key] = setting
      end
    end

    def save
      ActiveRecord::Base.transaction do
        dirty_settings.each do |_, setting|
          setting.save
        end
      end
    end

    def persisted?
      true
    end
  end
end
