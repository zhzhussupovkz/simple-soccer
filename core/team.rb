=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Team
class Team

  def initialize window, name, position
    @window, @name, @position = window, name, position
    @players = []
  end

  attr_reader :name

  def draw
    @players.each do |e| e.draw end
  end
  
end