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
  end

  def generate_players
    @players << Player.new(@window, @name, 5, 300, 'goalkeeper')
    @players << Player.new(@window, @name, 150, 150, 'defender')
    @players << Player.new(@window, @name, 150, 450, 'defender')
    @players << Player.new(@window, @name, 250, 150, 'midfielder')
    @players << Player.new(@window, @name, 250, 300, 'midfielder')
    @players << Player.new(@window, @name, 250, 450, 'midfielder')
    @players << Player.new(@window, @name, 350, 300, 'forward')
  end
  
end