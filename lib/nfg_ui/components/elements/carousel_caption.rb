# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Docs coming soon
      class CarouselCaption < Bootstrap::Components::CarouselCaption
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
      end
    end
  end
end
