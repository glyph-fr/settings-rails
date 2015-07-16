module SettingsRails
  class FloatSetting < SimpleValueSetting
    def value
      super.to_f
    end
  end
end
