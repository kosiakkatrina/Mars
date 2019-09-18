class MarsRover
attr_accessor :coordinates, :direction

def initialize(coordinates, direction)
  @coordinates = coordinates
  @direction = direction
end

def move(steps)
  right = {
      'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N'
  }

  steps.each do |step|
    if step == 'f'
      @coordinates[1] += 1
    elsif step == 'b'
      @coordinates[1] -= 1
    else
      @direction = right[@direction]
    end
  end
end
end



describe MarsRover do
  let (:mars_rover) { MarsRover.new([0,0],'S') }
  it "should have coordinates and direction" do
    expect(mars_rover.coordinates).to eq([0,0])
    expect(mars_rover.direction).to eq('S')
  end

  it "should be able to move forward once" do
    mars_rover.move(['f'])
    expect(mars_rover.coordinates).to eq([0,1])
  end

  it "should be able to move forward twice" do
    mars_rover.move(['f', 'f'])
    expect(mars_rover.coordinates).to eq([0,2])
  end

  it "should be able to move back once" do
    mars_rover.move(['b'])
    expect(mars_rover.coordinates).to eq([0,-1])
  end

  it "should be able to move back twice" do
    mars_rover.move(['b', 'b'])
    expect(mars_rover.coordinates).to eq([0,-2])
  end

  it "should be able to turn right once" do
    mars_rover.move(['r'])
    expect(mars_rover.direction).to eq('W')
  end

  it "should be able to turn right twice" do
    mars_rover.move(['r', 'r'])
    expect(mars_rover.direction).to eq('N')
  end

  it "should be able to turn right three times" do
    mars_rover.move(['r', 'r', 'r'])
    expect(mars_rover.direction).to eq('E')
  end

  it "should be able to turn right four times" do
    mars_rover.move(['r', 'r', 'r', 'r'])
    expect(mars_rover.direction).to eq('S')
  end

  it "should be able to turn left once" do
    mars_rover.move(['l'])
    expect(mars_rover.direction).to eq('E')
  end

end