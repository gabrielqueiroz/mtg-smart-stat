require_relative '../deck'

RSpec.describe 'Deck' do
  describe '#cards' do
    context "when muldrotha deck" do
      let(:deck) { VCR.use_cassette('muldrotha_edh') { Deck.new(file: file_path) } }
      let(:file_path) { "#{RSPEC_ROOT}/fixtures/example_decks/muldrotha_edh" }

      subject { deck }   

      it 'finds all cards from scryfall' do
        expect(subject.cards.size).to eq 84
      end
    end
  end
end