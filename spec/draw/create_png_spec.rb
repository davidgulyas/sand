RSpec.describe Draw::CreatePng do
  it "test1" do
    box = Sand::Sandbox.new(10,10,50)
    box.cells[0][0].height = 0
    box.cells[0][9].height = 25
    box.cells[9][0].height = 75
    box.cells[9][9].height = 100

    Draw::CreatePng.create_png_from_sandbox(box, './images/test1.png')
  end

end