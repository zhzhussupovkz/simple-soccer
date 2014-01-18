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
    generate_player Goalkeeper.new(@window, self, 780, 300)
    generate_player Defender.new(@window, self, 650, 150)
    generate_player Defender.new(@window, self, 650, 450)
    generate_player Midfielder.new(@window, self, 550, 150)
    generate_player Midfielder.new(@window, self, 550, 300)
    generate_player Forward.new(@window, self, 450, 300)
  end

end