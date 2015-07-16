# Settings Rails

Simple gem to create cacheable and administrable application wide settings.

Key / value settings are fed to a settings table, and the value is serialized
into JSON. This allows for creating as many setting type subclasses as you need.

This gem requires PostgreSQL >= 9.2 for its JSON column type.

## Installation

Add it to your Gemfile and bundle :

```ruby
gem 'settings-rails'
```

## Usage

### Fetching settings

To fetch stored settings all you need is to use the `Settings.fetch` method :

```ruby
Settings.fetch(:minimum_free_shipping_price)
```

If you're unsure wether the setting will be created or not at that moment,
you can pass it the type of the setting as an argument.

```ruby
Settings.fetch(:minimum_free_shipping_price, :float)
```

If not found, the setting will be built and have the right type.


To create settings you can either :

### Create settings from pure Ruby

With a console or through some seeds or rake task :

```ruby
Settings.build(:minimum_free_shipping_price, :float, 100.0).save!
```

The `Settings.build` method only creates a `SettingsRails::Setting` instance
and caches it. You need to call the `ActiveRecord::Base#save` method on it
to persist it.

### Create settings from a form

The gem contains a `SettingsRails::Form` class which allows you to easily
create nested settings form in one page.

```ruby
= form_for SettingsRails::Form.new do |form|
  = form.fields_for :settings, Settings.fetch(:minimum_free_shipping_price, :float) do |fields|
    = fields.hidden_field :key
    = fields.hidden_field :_type
    = fields.label :value, 'Minimum free shipping cart total price'
    = fields.number_field :value
```



