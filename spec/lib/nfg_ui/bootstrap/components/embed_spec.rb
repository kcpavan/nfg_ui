require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Embed do
  subject { described_class }
  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
end
