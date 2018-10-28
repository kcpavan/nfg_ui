# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Card traits
      module Alignment
        TRAITS = %i[right].freeze

        def right_trait
          options[:right] = true
        end
      end
    end
  end
end