class Node < ActiveRecord::Base
  belongs_to :right, class_name: "Node"
  belongs_to :left, class_name: "Node"

  #check the value of the root node vs the value to add
  #if the value is less than the root node, add it as the left child
  #if the value is greater than the root node, add it as the right child


  def insert(value)
    if value < self.value
      if self.left
        self.left.insert(value)
      else
        self.left = Node.create(value: value)
      end
    elsif value > self.value
      if self.right
        self.right.insert(value)
      else
        self.right = Node.create(value: value)
      end
    end
  end

  def count
    #count starts at one which is the current node
    #add to the node by going to the left or right if they are not nil
    count = 1
    count += self.left.count if self.left
    count += self.right.count if self.right
    count
  end

  def max
    #keep going to the right until self.right is nil
    unless self.right
      self.value
    else
      self.right.max
    end
  end

  def min
    #keep going left until self.left is nil
    unless self.left
      self.value
    else
      self.left.min
    end 
  end





end
