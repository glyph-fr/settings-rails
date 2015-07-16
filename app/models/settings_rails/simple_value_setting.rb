module SettingsRails
  class SimpleValueSetting < Setting
    store_accessor :data, :value

    def assign(val)
      self.value = val
    end
  end
end
