require "rails_admin_liquid_editor/engine"

module RailsAdminLiquidEditor
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class LiquidEditor < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types::register(self)
        end
      end
    end
  end
end

RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
  if properties[:name] == :liquid_editor
    fields << RailsAdmin::Config::Fields::Types::LiquidEditor.new(parent, properties[:name], properties)
    true
  else
    false
  end
end


