class Triangle
  # write code here
  attr_reader :length, :width, :heigth

  def initialize(length,width,heigth)
    @length = length
    @width = width
    @heigth = heigth
  end

  def kind
    if length == width && width == heigth
      return :equilateral
    elsif length == width || width == heigth || length == heigth
      return :isosceles
    else
      return :scalene
    end
  end


  def validate_triangle
    real_triangle =  [(length + width > heigth), (length + heigth > width), (width + heigth > length)]
      [length, width, heigth].each do |side|
        real_triangle << false if side <= 0 
      raise TriangleError if real_triangle.include?(false)
      end
  end

  class TriangleError < StandardError
    def message
      "Triangle inequality failed"
    end
  end
end
