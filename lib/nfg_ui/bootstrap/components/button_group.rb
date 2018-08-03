# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Group Component
      # An optional parent of the Button component
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class ButtonGroup < Bootstrap::Components::Base
        # include Bootstrap::Utilities::Sizable
        # include Bootstrap::Utilities::AriaAssistable

        # attr_reader :toolbar

        # def initialize(*)
        #   super
        #   build_aria(aria_key: :label, aria_value: 'action buttons')
        #   @toolbar = traits.include?(:toolbar)
        # end

        private

        def component_css_class
          p "====== Printed from: (Bootstrap::Components::ButtonGroup) self.class.name: #{self.class.name} method: #{__method__}"
          'btn-group'
        end

        # def trait_css_classes
        #   traits.include?(:vertical) ? "#{component_css_class}-vertical" : super
        # end

        def assistive_html_attributes
          p "====== Printed from: (Bootstrap::Components::ButtonGroup) self.class.name: #{self.class.name} method: #{__method__}"
          super.merge!(role: 'group')
        end
      end
    end
  end
end
