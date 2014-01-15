=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Ball
class Ball

  def initialize window
    @window = window
    @image = Gosu::Image.new window, "images/ball.png", true
  end
  
  def draw
    @image.draw 392.5, 292.5, 2
  end
  
end