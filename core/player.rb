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

  attr_reader :window, :me
  attr_accessor :x, :y

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
      run_with_ball
    end
  end

  #run
  def run
    case face
    when 'first'
      move_first self, 5
    when 'second'
      move_second self, 5
    when 'third'
      move_third self, 5
    when 'fourth'
      move_fourth self, 5
    end
  end

  #run with ball
  def run_with_ball
    ball = window.world.ball
    if Gosu::distance(ball.x, ball.y, x, y) <= 10
      case face
      when 'first'
        if x <= ball.x && y >= ball.y
         move_first ball, 5
         move_first ball, 100 if window.button_down? Gosu::KbD
        end
      when 'second'
        if x >= ball.x && y >= ball.y
          move_second ball, 5
          move_second ball, 100 if window.button_down? Gosu::KbD
        end
      when 'third'
        if x >= ball.x && y <= ball.y
          move_third ball, 5
          move_third ball, 100 if window.button_down? Gosu::KbD
        end
      when 'fourth'
        if x <= ball.x && y <= ball.y
          move_fourth ball, 5
          move_fourth ball, 100 if window.button_down? Gosu::KbD
        end
      end
    end
  end

  #move in first
  def move_first object, px
    object.x += px * Math.sin(Math::PI * angle / 180) if object.x <= 790
    object.y -= px * Math.cos(Math::PI * angle / 180) if object.y >= 5
  end

  #move in second
  def move_second object, px
    object.x -= px * Math.sin(2*Math::PI - Math::PI * angle / 180) if object.x >= 5
    object.y -= px * Math.cos(2*Math::PI - Math::PI * angle / 180) if object.y >= 5
  end

  #move in third
  def move_third object, px
    object.x -= px * Math.sin(Math::PI * angle / 180 - Math::PI) if object.x >= 5
    object.y += px * Math.cos(Math::PI * angle / 180 - Math::PI) if object.y <= 590
  end

  #move in fourth
  def move_fourth object, px
    object.x -= px * Math.sin(Math::PI * angle / 180 - Math::PI) if object.x >= 5
    object.y += px * Math.cos(Math::PI * angle / 180 - Math::PI) if object.y <= 590
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