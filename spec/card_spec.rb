require_relative '../card'

RSpec.describe 'Card' do
  describe "#stat", vcr: true do
    subject { Card.new(name: name).stats }

    context 'when ramp' do
      context 'from bringing land to battlefield' do
        let(:name) { 'Sakura-Tribe Elder' }

        it { expect(subject).to eq ['ramp'] }  
      end
      
      context "from mana dork" do
        let(:name) { 'Llanowar Elves' }

        it { expect(subject).to eq ['ramp'] }
      end

      context "from mana rock" do
        let(:name) { 'Sol Ring' }

        it { expect(subject).to eq ['ramp'] }
      end
    end

    context 'when draw' do
      context 'from drawing cards' do
        let(:name) { 'Divination' }

        it { expect(subject).to eq ['draw'] }
      end
    end

    context 'when board wipe' do
      context 'from destroying all creatures' do
        let(:name) { 'Wrath of God' }

        it { expect(subject).to eq ['board wipe'] }
      end

      context 'from returning all to their owner hand' do
        let(:name) { 'Aetherize' }

        it { expect(subject).to eq ['board wipe'] }
      end
    end

    context 'when single target removal' do
      context 'beast within' do
        let(:name) { 'Beast within' }

        it { expect(subject).to eq ['single target removal'] }
      end
      context 'when exile' do
        let(:name) { 'Path to exile' }

        it { expect(subject).to eq ['single target removal'] }
      end
    end

    context 'when overload' do
      context 'destroy target/all' do
        let(:name) { 'Vandalblast' }

        it { expect(subject).to eq ['single target removal', 'board wipe'] }
      end

      context 'return target/all' do
        let(:name) { 'Cyclonic Rift' }

        it { expect(subject).to eq ['board wipe'] }
      end
    end
  end
end