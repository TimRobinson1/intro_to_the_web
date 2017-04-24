require 'game'

describe Game do
  subject(:game) { described_class.new }
  let(:jeff) { double :player, health: 100 }

  it { is_expected.to respond_to :take_damage }

  describe '#take_damage' do
    it 'calls appropriate damage method onplayer' do
      allow(jeff).to receive(:take_damage).and_return(90)
      expect(game.take_damage(jeff)).to eq 90
    end
  end
end
