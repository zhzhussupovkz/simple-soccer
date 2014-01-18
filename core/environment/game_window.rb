=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#GameWindow
class GameWindow < Gosu::Window

  include Singleton

  def initialize
    super 800, 600, false
    self.caption = "Soccer Game"
    @world = World.new self
  end

  attr_reader :world
  
  def draw
    @world.draw
  end

  def update
    @world.update
  end

  #button down event
  def button_down(key)
    case key
    when Gosu::KbEscape
      close
    end
  end

end