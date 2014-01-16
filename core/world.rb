=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#World
class World

  def initialize window
    @window = window
    @ground = Gosu::Image.new window, "images/ground.png", true
    @ball = Ball.new window
    @left = LeftTeam.new window, 'spain'
    @right = RightTeam.new window, 'brazil'
  end

  attr_reader :ball
  
  def draw
    @ground.draw(0, 0, 1)
    @ball.draw
    @left.draw
    @right.draw
  end

  def update
    @left.update
    @right.update
  end
  
end