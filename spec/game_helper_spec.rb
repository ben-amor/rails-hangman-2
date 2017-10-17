require 'rails_helper'

describe GameHelper, :type => :helper do
  describe "#create_hint_for_screen" do

    context 'when the array only contains nil' do
      it 'renders a string of dashes' do
        expect(helper.create_hint_for_screen([nil,nil])).to eq('__')
      end
    end

    context 'when the array contains characters' do
      it 'renders the expected word' do
        expect(helper.create_hint_for_screen(['h', 'i'])).to eq('hi')
      end
    end

    context 'when the array contains a mixture of nil and characters' do
      it 'renders the expected word' do
        expect(helper.create_hint_for_screen(['o', nil, 'l'])).to eq('o_l')
      end
    end

  end
end
