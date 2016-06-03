class Node < ActiveRecord::Base
  belongs_to :right, class_name: "Node"
  belongs_to :left, class_name: "Node"


  def insert(value)
    if value < self.value
      insert_left(value)
    elsif value > self.value
      insert_right(value)
    end
  end

  #this method has 4 paths through the code;
  #you can put the logic in different piles but can't refactor into fewer paths

  def insert_left(value)
    if self.left
      self.left.insert(value)
    else
      self.left = Node.create(value: value)
    end
  end

  def insert_right(value)
    if self.right
      self.right.insert(value)
    else
      self.right = Node.create(value: value)
    end
  end

  #could write an insert side method, but this could
  #just make it more annoying to read

  def count
    count = 1
    count += left.count if left
    count += right.count if right
    count
  end
  #can take out the self and just call left/right

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

  # def min
  #   if left
  #     left.min
  #   else
  #     self.value
  #   end
  # end

  end
end
