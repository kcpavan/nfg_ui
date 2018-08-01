# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Media Object Layout Component
      # https://getbootstrap.com/docs/4.1/layout/media-object/
      class MediaObject < Bootstrap::Components::Base
        private

        def component_css_class
          'media'
        end
      end
    end
  end
end
