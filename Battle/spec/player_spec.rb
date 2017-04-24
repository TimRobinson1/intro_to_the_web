require 'player'

describe Player do
  subject(:player) { described_class.new("Dave")}

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :health }

  it 'should return the correct name' do
    expect(player.name).to eq "Dave"
  end

  it 'starts with 100 health' do
    expect(player.health).to eq 100
  end

  describe '#take_damage' do
    it 'subtracts 10 from health when attacked' do
      player.take_damage
      expect(player.health).to eq 90
    end
  end
end
