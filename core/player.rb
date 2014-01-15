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
    @angle, @me, @turn = 90, false, 0
    @image = Gosu::Image.new(window, "images/teams/"+ @team +".png", true)
    @ui = Gosu::Font.new(window, 'Monaco', 20)
  end

  attr_reader :window, :x, :y, :me

  def draw
    @image.draw_rot x, y, 2, @angle
    @ui.draw("angle: #{angle}", 10, 10, 3)
  end

  #angle
  def angle
    @turn += 1 if @angle % 360 == 0
    if @angle >= 0 && @angle <= 360
      @angle
    elsif @angle > 360
      360 - @angle * @turn
    elsif @angle < 0
      360 - (360 + @angle) * @turn
    end
  end

  #turn left
  def turn_left
    @angle -= 5.0
  end

  #turn right
  def turn_right
    @angle += 5.0
  end

  #main move - user control when his with ball
  def move
    #if me
    turn_left if window.button_down? Gosu::KbLeft
    turn_right if window.button_down? Gosu::KbRight
    run if window.button_down? Gosu::KbUp
    #end
  end

  #run
  def run
    case face
    when 'first'
      @x += 5*Math.sin(angle)
      @y -= 5*Math.cos(angle)
    when 'second'
      @x -= 5*Math.sin(360 - angle)
      @y -= 5*Math.cos(360 - angle)
    when 'third'
      @x -= 5*Math.sin(angle - 180)
      @y += 5*Math.cos(angle - 180)
    when 'four'
      @x += 5*Math.sin(180 - angle)
      @y += 5*Math.cos(180 - angle)
    end
  end

  #face
  def face
    if angle.between?(0, 90)
      'first'
    elsif angle.between?(270, 360)
      'second'
    elsif angle.between?(180, 270)
      'third'
    elsif angle.between?(90, 180)
      'fourth'
    end
  end
  
  #player with ball
  def with_ball
    @me = true
  end

  #player without ball
  def without_ball
    @me = false
  end

end