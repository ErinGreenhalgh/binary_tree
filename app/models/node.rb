class Node < ActiveRecord::Base
  belongs_to :right, class_name: "Node"
  belongs_to :left, class_name: "Node"


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
    count = 1
    count += self.left.count if self.left
    count += self.right.count if self.right
    count
  end

  def max
    unless self.right
      self.value
    else
      self.right.max
    end
  end

  def min
    unless self.left
      self.value
    else
      self.left.min
    end
  end
end
