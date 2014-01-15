=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#RightTeam
class RightTeam < Team

  def initialize window, name
    super window, name, "right"
    generate_players
  end

  def generate_players
    @players << Player.new(@window, @name, 780, 300, 'goalkeeper')
    @players << Player.new(@window, @name, 650, 150, 'defender')
    @players << Player.new(@window, @name, 650, 450, 'defender')
    @players << Player.new(@window, @name, 550, 150, 'midfielder')
    @players << Player.new(@window, @name, 550, 300, 'midfielder')
    @players << Player.new(@window, @name, 550, 450, 'midfielder')
    @players << Player.new(@window, @name, 450, 300, 'forward')
  end
  
end