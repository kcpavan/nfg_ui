require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::DropdownToggle do
  let(:dropdown_toggle) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module'


  describe '#offset' do
    subject { dropdown_toggle.offset }
    let(:tested_offset) { '10,20' }

    context 'when offset is supplied in options' do
      let(:options) { { offset: tested_offset } }
      it { is_expected.to eq tested_offset }
    end

    context 'when button text is not supplied in options' do
      it { is_expected.to eq '' }
    end
  end

  describe '#data' do
    subject { dropdown_toggle.data }
    context 'when offset is present' do
      let(:options) { { offset: '10,20' } }
      it { is_expected.to eq(toggle: 'dropdown', offset: '10,20') }
    end

    context 'when offset is not present' do
      it { is_expected.to eq(toggle: 'dropdown') }
    end
  end

  describe '#theme' do
    subject { dropdown_toggle.theme }

    let(:tested_theme) { :warning }
    context 'when theme is present in options' do
      let(:options) { { theme: tested_theme } }
      it { is_expected.to eq tested_theme }
    end

    context 'when theme is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq NfgUi::DEFAULT_BOOTSTRAP_THEME }
    end
  end

  describe '#html_options' do
    subject { dropdown_toggle.html_options }
    context 'when :as is :a' do
      let(:options) { { as: :a } }
      it { is_expected.to include(href: '#')  }
    end

    context 'when :as is not :a' do
      it { is_expected.not_to include(href: '#')  }
    end
  end

  describe '#component_family' do
    subject { dropdown_toggle.component_family }
    it { is_expected.to eq :dropdown }
  end

  describe 'private methods' do
    subject { dropdown_toggle.send(tested_method) }

    describe '#default_html_wrapper_element' do
      let(:tested_method) { :default_html_wrapper_element }
      it { is_expected.to eq :button }
    end

    describe '#assistive_html_attributes' do
      let(:tested_method) { :assistive_html_attributes }
      it { is_expected.to eq({ aria: { haspopup: "true", expanded: "false" } }) }
    end

    describe '#non_html_attribute_options' do
      let(:tested_method) { :non_html_attribute_options }
      it { is_expected.to include :offset }
    end
  end
end
