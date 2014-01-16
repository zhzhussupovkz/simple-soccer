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
    @angle, @me = 90, false
    @image = Gosu::Image.new(window, "images/teams/"+ @team +".png", true)
  end

  attr_reader :window, :x, :y, :me

  def draw
    @image.draw_rot x, y, 2, @angle
  end

  #angle
  def angle
    @angle % 360
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
    if me
      turn_left if window.button_down? Gosu::KbLeft
      turn_right if window.button_down? Gosu::KbRight
      run if window.button_down? Gosu::KbUp
    end
  end

  #run
  def run
    case face
    when 'first'
      @x += 5*Math.sin(Math::PI * angle / 180) if @x <= 790
      @y -= 5*Math.cos(Math::PI * angle / 180) if @y >= 5
    when 'second'
      @x -= 5*Math.sin(2*Math::PI - Math::PI * angle / 180) if @x >= 5
      @y -= 5*Math.cos(2*Math::PI - Math::PI * angle / 180) if @y >= 5
    when 'third'
      @x -= 5*Math.sin(Math::PI * angle / 180 - Math::PI) if @x >= 5
      @y += 5*Math.cos(Math::PI * angle / 180 - Math::PI) if @y <= 590
    when 'fourth'
      @x += 5*Math.sin(Math::PI - Math::PI * angle / 180) if @x <= 790
      @y += 5*Math.cos(Math::PI - Math::PI * angle / 180) if @y <= 585
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