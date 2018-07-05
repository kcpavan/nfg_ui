# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Applies ability to modify the component's size
      # Pass in :lg or :sm
      module Sizable
        attr_accessor :size

        def initialize(component_options)
          super
          self.size = component_options.fetch(:size, default_size)
        end

        def resized?
          bootstrap4_size_options.include?(size)
        end

        private

        def defaults
          super.merge(size: default_size)
        end

        def css_classes
          resized? ? super + size_css_class : super
        end

        def size_css_class
          " #{component_css_class}-#{size}" if resized?
        end

        def non_html_attribute_options
          super.push(:size)
        end

        def bootstrap4_size_options
          %i[sm lg]
        end

        def default_size
          nil
        end
      end
    end
  end
end
