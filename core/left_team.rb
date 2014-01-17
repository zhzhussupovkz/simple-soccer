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
    generate_players
    @main = @players[0]
  end

  def generate_players
    @players << Player.new(@window, @name, 20, 300, 'goalkeeper')
    @players << Player.new(@window, @name, 150, 150, 'defender')
    @players << Player.new(@window, @name, 150, 450, 'defender')
    @players << Player.new(@window, @name, 250, 150, 'midfielder')
    @players << Player.new(@window, @name, 250, 300, 'midfielder')
    @players << Player.new(@window, @name, 250, 450, 'midfielder')
    @players << Player.new(@window, @name, 350, 300, 'forward')
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
    @main = min
  end

  def update
    super
    set_main_player
  end
  
end