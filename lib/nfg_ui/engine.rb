# frozen_string_literal: true

module NfgUi
  class Engine < ::Rails::Engine
    isolate_namespace NfgUi

    config.before_initialize do
      ActiveSupport.on_load :action_controller do
        helper NfgUi::ApplicationHelper
      end
    end
  end
end
