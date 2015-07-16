class CreateSettingsRailsSettings < ActiveRecord::Migration
  def change
    create_table :settings_rails_settings do |t|
      t.string :key
      t.json :data

      t.string :type

      t.timestamps null: false
    end
  end
end
