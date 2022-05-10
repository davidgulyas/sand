RSpec.describe Sand::Gravity do
  it "can pop an element from a set" do
    s = Set.new([1,2,3])
    element = Sand::Gravity.set_pop(s)
    # expect that element isn't in set anymore and is one of [1,2,3]

  end
end