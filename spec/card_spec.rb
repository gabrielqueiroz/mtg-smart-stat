require_relative '../card'

RSpec.describe 'Card' do
  describe "#stat", vcr: true do
    subject { Card.new(name: name).stats }

    context 'when ramp' do
      context 'with bringing land to battlefield' do
        let(:name) { 'Sakura-Tribe Elder' }

        it { expect(subject).to eq ['ramp'] }  
      end
      
      context "with mana dork" do
        let(:name) { 'Llanowar Elves' }

        it { expect(subject).to eq ['ramp'] }
      end

      context "with mana rock" do
        let(:name) { 'Sol Ring' }

        it { expect(subject).to eq ['ramp'] }
      end
    end

    context 'when draw' do
      context 'with drawing cards' do
        let(:name) { 'Divination' }

        it { expect(subject).to eq ['draw'] }
      end
    end

    context 'when board wipe' do
      context 'with destroying all creatures' do
        let(:name) { 'Wrath of God' }

        it { expect(subject).to eq ['board wipe'] }
      end

      context 'with returning all to their owner hand' do
        let(:name) { 'Aetherize' }

        it { expect(subject).to eq ['board wipe'] }
      end
    end

    context 'when single target removal' do
      context 'with destroy target' do
        let(:name) { 'Beast within' }

        it { expect(subject).to eq ['single target removal'] }
      end

      context 'with exile target' do
        let(:name) { 'Swords to Plowshares' }

        it { expect(subject).to eq ['single target removal'] }
      end
    end

    context 'when overload' do
      context 'with destroy target/all' do
        let(:name) { 'Vandalblast' }

        it { expect(subject).to eq ['single target removal', 'board wipe'] }
      end

      context 'with return target/all' do
        let(:name) { 'Cyclonic Rift' }

        it { expect(subject).to eq ['single target removal', 'board wipe'] }
      end
    end
  end
end