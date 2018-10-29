# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # MediaObject doc coming soon
      class MediaBody < Bootstrap::Components::MediaBody
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
      end
    end
  end
end
