require 'player'

describe Player do
  subject(:player) { described_class.new("Dave")}

  it { is_expected.to respond_to :name }

  it 'should return the correct name' do
    expect(player.name).to eq "Dave"
  end
end
