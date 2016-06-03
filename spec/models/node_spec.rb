require "rails_helper"

RSpec.describe Node, type: :model do

  it "node exists with correct attributes" do
    root = Node.new(value: 10)
    expect(root.respond_to?(:value)).to be true
    expect(root.respond_to?(:left)).to be true
    expect(root.respond_to?(:right)).to be true
    expect(root.value).to eq(10)
  end

  it "is a root node" do
    #is root if its ID is not in left/right column on table

  end

  context "it adds nodes one level deep" do
    it "can add a node that is less than the root" do
      root = Node.create(value: 10)
      root.insert(5)
      expect(root.left.value).to eq(5)
    end

    it "can add a node that is greater that the root" do
      root = Node.create(value: 10)
      root.insert(15)
      expect(root.right.value).to eq(15)
    end
  end

  context "it adds things two or more levels deep" do
    it "can add multiple nodes" do
      root = Node.create(value: 10)
      root.insert(5)
      root.insert(2)

      expect(root.left.value).to eq (5)
      expect(root.left.left.value).to eq (2)
      root.insert(6)

      expect(root.left.right.value).to eq (6)
    end

      it "can add lots of nodes" do
        root = Node.create(value: 10)
        root.insert(5)
        root.insert(2)
        root.insert(6)
        root.insert(12)
        root.insert(3)
        root.insert(14)
        root.insert(7)
        expect(root.left.right.right.value).to eq(7)
        expect(root.left.left.right.value).to eq(3)
        expect(root.right.right.value).to eq(14)
      end
    end

  context "count multiple nodes" do
    it "gives the count" do
      root = Node.create(value: 10)
      root.insert(5)
      root.insert(2)
      root.insert(6)

      #could also do this:
      #[4, 2, 3, 7, 10, 2].each do |i|
      #  n.insert(i)
      #end 
      expect(root.count).to eq(4)
    end
  end

  context "it can find max and min" do
    it "can find the max" do
      root = Node.create(value: 10)
      root.insert(5)
      root.insert(2)
      root.insert(6)
      root.insert(12)
      root.insert(3)
      root.insert(14)
      root.insert(7)
      root.insert(15)
      expect(root.max).to eq(15)
    end

    it "can find the min" do
      root = Node.create(value: 10)
      root.insert(5)
      root.insert(2)
      root.insert(6)
      root.insert(12)
      root.insert(3)
      root.insert(14)
      root.insert(7)
      expect(root.min).to eq(2)
    end


  end







end
