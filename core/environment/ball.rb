=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Ball
class Ball

  def initialize window
    @window, @x, @y = window, 392.5, 292.5
    @image = Gosu::Image.new window, "images/ball.png", true
  end
  
  attr_accessor :x, :y

  def draw
    @image.draw x, y, 2
  end
  
end