require 'game'

describe Game do
  let(:jeff) { double :player, health: 100, name: 'Jeff' }
  let(:bill) { double :player, health: 100 }
  subject(:game) { described_class.new(jeff, bill) }

  it { is_expected.to respond_to :take_damage }

  it 'starts with player one' do
    expect(game.p1).to eq jeff
  end

  it 'starts with player two' do
    expect(game.p2).to eq bill
  end

  describe '#take_damage' do
    it 'calls appropriate damage method onplayer' do
      allow(jeff).to receive(:take_damage).and_return(90)
      expect(game.take_damage(jeff)).to eq 90
    end
  end

  describe '#p1_name' do
    it 'returns player name' do
      expect(game.p1_name).to eq 'Jeff'
    end
  end

  describe '#p2_health' do
    it 'returns player health' do
      expect(game.p2_health).to eq 100
    end
  end

  describe '#current_player' do
    it 'returns player 1 by default' do
      expect(game.current_player).to eq jeff
    end
  end
  describe '#switch_player' do
    it 'returns player 2 after switching' do
      game.switch_player
      expect(game.current_player).to eq bill
    end
  end
end