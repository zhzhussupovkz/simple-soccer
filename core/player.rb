=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Player
class Player

  def initialize window, team, x, y, role
    @window, @team, @x, @y, @role = window, team, x, y, role
    @angle = 90
    @image = Gosu::Image.new(window, "images/teams/"+ @team +".png", true)
  end

  attr_reader :x, :y, :angle
  
  def draw
    @image.draw_rot x, y, 2, angle
  end
  
end