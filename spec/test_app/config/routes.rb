Rails.application.routes.draw do
  mount NfgUi::Engine => '/nfg_ui'
  root 'dashboard#index'
  resources :dashboard, only: [:index]

  namespace :bootstrap do
    NfgUi::BOOTSTRAP_COMPONENT_NAMES.each do |resource|
      resources resource.to_s.pluralize.to_sym, only: [:index]
    end
  end

  namespace :elements do
    NfgUi::ELEMENT_COMPONENT_NAMES.each do |resource|
      resources resource.to_s.pluralize.to_sym, only: [:index]
    end
  end

  namespace :foundations do
    NfgUi::FOUNDATION_COMPONENT_NAMES.each do |resource|
      resources resource.to_s.pluralize.to_sym, only: [:index]
    end
  end

  namespace :patterns do
    NfgUi::PATTERN_COMPONENT_NAMES.each do |resource|
      resources resource.to_s.pluralize.to_sym, only: [:index]
    end
  end
end
