# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Group Component
      # An optional parent of the Button component
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class ButtonGroup < Bootstrap::Components::Base
        include Bootstrap::Utilities::Sizable
        include Bootstrap::Utilities::AriaAssistable

        def initialize(component_options)
          super
          build_aria(aria_key: :label, aria_value: 'action buttons')
        end

        private

        def component_css_class
          'btn-group'
        end

        def trait_css_classes
          traits.include?(:vertical) ? "#{component_css_class}-vertical" : super
        end

        def assistive_html_attributes
          options[:role] ? super : super.merge!(role: 'group')
        end
      end
    end
  end
end
