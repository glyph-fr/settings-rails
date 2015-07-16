class Settings
  class << self
    def get(key, type = :string)
      SettingsRails::Cache.fetch(key) || build(key, type)
    end

    def build(key, type, value = nil)
      setting = SettingsRails::Setting.for(type).new(key: key, value: value)
      SettingsRails::Cache.add(key, setting)
      setting
    end
  end
end
