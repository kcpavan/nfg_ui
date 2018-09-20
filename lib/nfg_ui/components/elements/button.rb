# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Button doesn't have any customizations unique to the design system yet
      # As such, the NFG UI Button is simply a bootstrap Button behind the scenes.
      # Traits will eventually be connected here.
      class Button < Bootstrap::Components::Button
        include NfgUi::Components::Traits::Button
        include NfgUi::Components::Utilities::Iconable
        include Bootstrap::Utilities::Tooltipable

        attr_reader :disable_with, :data, :remote

        def initialize(*)
          super
          @body = text_maybe_with_icon
          @disable_with = options.fetch(:disable_with, nil)
          @remote = options.fetch(:remote, false)
          update_data_attributes
        end

        private

        def disable_with_text
          @disable_with_text ||= disable_with
        end

        def update_data_attributes
          updated_data = disable_with_text.present? ? { disable_with: disable_with_text } : {}
          updated_data[:remote] = remote if remote

          data.merge!(updated_data)
        end

        def defaults
          super.merge(disable_with: default_disable_with)
        end

        def non_html_attribute_options
          super.push(:disable_with, :remote)
        end

        def default_disable_with
          false
        end
      end
    end
  end
end
