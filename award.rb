############### OOP approach ####################
class Award
  attr_reader :name
  attr_accessor :expires_in, :quality

  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

end

############### Explanation ####################
=begin
First, the award name is only given readability access because the name will be assigned based on the type
of award (Blue Star, etc.)

The value of expires_in will be calculated based on the current date and quality will be calculated based
on expired_in.


=end


################ Legacy code ###################
=begin
Award = Struct.new(:name, :expires_in, :quality)
=end


