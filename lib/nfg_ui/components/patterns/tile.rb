# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Tile doc coming soon
      class Tile < NfgUi::Components::Base
        include Bootstrap::Utilities::Collapsible

        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Titleable
        
        include NfgUi::Components::Traits::Collapse

        def heading
          options.fetch(:heading, nil)
        end

        def component_family
          :tile
        end

        private

        def non_html_attribute_options
          super.push(:heading)
        end
      end
    end
  end
end
