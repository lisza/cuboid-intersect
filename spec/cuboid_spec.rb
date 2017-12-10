require 'cuboid'

describe Cuboid do
  subject { Cuboid.new(origin, dimensions) }
  let(:origin) { [0, 0, 0] }
  let(:dimensions) { [1, 1, 1] }
  let(:bad_origin) { [-2, -2, -2] }
  let(:bad_dimensions) { [0, 0, -2] }
  
  describe "initialize" do
    it "returns an instance of Cuboid" do
      expect(subject).to be_an_instance_of Cuboid
    end
    
    # As we haven't defined containing boundaries or a Container class, I'm skipping this test for now.
    # it "returns an argument error if origin is out of bounds" do
    #   expect{ Cuboid.new(bad_origin, dimensions) }.to raise_error(ArgumentError, 'Position is out of bounds')
    # end
    
    it "returns an argument error if dimensions are negative or zero" do
      expect{ Cuboid.new(origin, bad_dimensions) }.to raise_error(ArgumentError, 'Dimensions cannot be negative or zero')
    end
  end
 
  describe "move_to!" do
    it "changes the origin in the simple happy case" do
      expect(subject.move_to!([1,2,3])).to be true
    end
    
    it "updates the cuboid's position correctly" do
      subject.move_to!([1, 2, 3])
      expect(subject.pos).to eq [1, 2, 3] 
    end
  end    
  
  describe "vertices" do
    it "returns an array of the cuboid's vertices" do
      expect(subject.vertices).to eq [[0, 0, 0], [0, 1, 0], [1, 0, 0], [1, 1, 0], [0, 0, 1], [0, 1, 1], [1, 0, 1], [1, 1, 1]]
    end
  end
  
  describe "intersects?" do
    let(:overlapping_cuboid) { Cuboid.new([0, 0, 0], [1, 2, 3]) }
    let(:non_overlapping_cuboid) { Cuboid.new([4, 4, 4], [1, 2, 3]) }
    
    it "correctly detects an overlapping cuboid" do
      expect(subject.intersects?(overlapping_cuboid)).to be true
    end
    
    it "correctly detects a non-overlapping cuboid" do
      expect(subject.intersects?(non_overlapping_cuboid)).to be false
    end
  end

end
