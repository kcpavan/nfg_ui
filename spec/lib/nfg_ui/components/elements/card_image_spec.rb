require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::CardImage do
  let(:card_image) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} } 
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::CardImage }
  it_behaves_like 'a component with a consistent initalized construction'

  pending 'Needs spec updates'
end