require "pry"
class Triangle

  attr_reader :s1, :s2, :s3

  def initialize(s1,s2,s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  def kind 
    # binding.pry 
    if (!self.valid)
      raise TriangleError    
    elsif @s1 == @s2 && @s2 == @s3
      :equilateral
    elsif (@s1 == @s2 || @s2 == @s3 || @s1==@s3)
      :isosceles 
    else 
      :scalene
    end
  end

  class TriangleError < StandardError

  end

  private 

  def valid
    sides_above_zero = (@s1 > 0 && @s2 > 0 && @s3 > 0)
    valid_ratio = (@s1+@s2>@s3 && @s2+@s3>@s1 && @s1+@s3>@s2)
    sides_above_zero && valid_ratio
  end

end
