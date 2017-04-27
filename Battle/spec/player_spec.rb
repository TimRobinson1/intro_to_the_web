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
    it 'subtracts appropriate amount from health when attacked' do
      srand(5)
      expect { player.take_damage }.to change { player.health }.by(-10)
    end
  end
end
