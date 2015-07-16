module SettingsRails
  class Setting < ActiveRecord::Base
    def self.for(type)
      class_name = class_name_for(type)

      begin
        class_name.constantize
      rescue NameError => e
        e.message = "Setting type does not exist : #{ type } ...\n#{ e.message }"
        raise e
      end
    end

    def self.class_name_for(type)
      model_name = [type.to_s.camelize, 'Setting'].join
      ['SettingsRails', model_name].join('::')
    end

    def _type
      (type || self.class.name).demodulize.underscore.gsub(/_setting$/, '')
    end

    def _type=(val)
      self.type = self.class.class_name_for(val.to_s)
    end
  end
end
