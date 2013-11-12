require "liquid"
require "codemirror-rails"

require "rails_admin_liquid_editor/engine"
require "rails_admin_liquid_editor/previewer"

module RailsAdminLiquidEditor
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Liquid < Text

          register_instance_option :partial do
            :form_liquid
          end

          register_instance_option :codemirror_css_location do
            "#{Rails.application.config.assets.prefix}/rails_admin/codemirror.css"
          end

          register_instance_option :codemirror_js_location do
            "#{Rails.application.config.assets.prefix}/rails_admin/codemirror.js"
          end

          register_instance_option :codemirror_assets do
            {
              :mode  => "#{Rails.application.config.assets.prefix}/rails_admin/codemirror/modes/liquid.js",
              :theme => "#{Rails.application.config.assets.prefix}/rails_admin/codemirror/modes/liquid.css"
            }
          end

          register_instance_option :codemirror_config do
            {
              :mode  => 'htmlmixedliquid',
              :theme => 'default'
            }
          end

          RailsAdmin::Config::Fields::Types.register(self)
        end
      end
    end
  end
end

RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
  if properties[:name] == :liquid
    fields << RailsAdmin::Config::Fields::Types::Liquid.new(parent, properties[:name], properties)
    true
  else
    false
  end
end

require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class LiquidPreview < Base

        register_instance_option :member? do
          true
        end

        register_instance_option :visible? do
          false
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :authorization_key do
          :show
        end

        register_instance_option :controller do
          Proc.new do
            render :inline => RailsAdminLiquidEditor::Previewer.new(Liquid::Template.parse(params[:liquid])).render
          end
        end

        RailsAdmin::Config::Actions.register(self)
      end
    end
  end
end