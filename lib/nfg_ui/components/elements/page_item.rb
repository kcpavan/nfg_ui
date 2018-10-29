# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Pagination sub component (page items)
      class PageItem < Bootstrap::Components::PageItem
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
      end
    end
  end
end
