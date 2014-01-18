=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#LeftTeam
class LeftTeam < Team

  def initialize window, name
    super window, name, "left"
    generate_player Goalkeeper.new(@window, self, 150, 150)
    generate_player Defender.new(@window, self, 150, 450)
    generate_player Defender.new(@window, self, 250, 150)
    generate_player Midfielder.new(@window, self, 250, 300)
    generate_player Midfielder.new(@window, self, 250, 450)
    generate_player Forward.new(@window, self, 350, 300)
  end

  #set player with ball
  def set_main_player
    min = @players[0]
    dist = Gosu::distance(min.x, min.y, @window.world.ball.x, @window.world.ball.y)
    @players.each do |e|
      min = e if Gosu::distance(e.x, e.y, @window.world.ball.x, @window.world.ball.y) <= dist
    end
    @players.each do |e| e.without_ball end
    min.with_ball
  end

  def update
    super
    set_main_player
  end
  
end