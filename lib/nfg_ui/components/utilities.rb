# frozen_string_literal: true

module NfgUi
  module Components
    # Autoloads utilities unique for NFG design system components
    module Utilities
      extend ActiveSupport::Autoload

      autoload :Iconable
      autoload :Titleable
      autoload :Requireable
    end
  end
end