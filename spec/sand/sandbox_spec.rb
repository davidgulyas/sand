RSpec.describe Sand::Sandbox do
  it "can find the extremes of sand height" do
    box = Sand::Sandbox.new(5,5,10)
    box.cells[1][1].height = 4
    box.cells[1][2].height = 14
    min, max = box.get_extremes

    expect(min).to eq(4)
    expect(max).to eq(14)
  end
end
