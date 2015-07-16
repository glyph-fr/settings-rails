module SettingsRails
  class Cache
    def self.fetch(key)
      instance.fetch(key)
    end

    def self.add(key, setting)
      instance.store[key] = setting
    end

    def self.instance
      RequestStore.store['settings_rails.cache'] ||= new
    end

    def self.each(&block)
      instance.store.each(&block)
    end

    def fetch(key)
      store[key]
    end

    def store
      @store ||= SettingsRails::Setting.all.each_with_object({}.with_indifferent_access) do |setting, hash|
        hash[setting.key] = setting
      end
    end
  end
end
