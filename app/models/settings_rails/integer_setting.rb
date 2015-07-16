module SettingsRails
  class IntegerSetting < SimpleValueSetting
    def value
      super.to_i
    end
  end
end
