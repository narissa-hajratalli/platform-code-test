############### OOP approach ####################
class Award
  attr_reader :name
  attr_accessor :expires_in, :quality

  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality

    quality_bounds
  end

  # Adhere to base cases:
  # Award quality can never be above 50 UNLESS it is a Blue Distinction Plus award
  # and award quality can never be less than 0
  def quality_bounds
    if self.quality > 50 && name != "Blue Distinction Plus"
      self.quality = 50
    elsif self.quality < 0
      self.quality = 0
    end
  end

  # Defining if the award has expired if expires_in is equal to 0
  def has_expired
    self.expires_in < 0
  end

  # Setting base value for quality score
  def quality_score
    if self.name == "Blue Distinction Plus"
      @quality = 80
    elsif
      @quality
    end
  end

  # Update the award expiration and the quality unless it is a
  # Blue Distinction Plus award, which will always have a score of 80
  def update
    unless name == "Blue Distinction Plus"
      update_expiration
      update_quality
    end
  end

  # Updating the expiration date as it decreases by 1 each day
  def update_expiration
    self.expires_in -= 1
  end

  # Calculating the amount needed to appropriately update the quality
  def update_quality
    if self.name == "Blue Compare" && has_expired
      self.quality = 0
      return
    end

    # If the award has expired, the quality will decrease by a magnitude
    # of 2; if the award hasn't expired, quality will decrease by a magnitude of 1
    magnitude = has_expired ? 2 : 1

    change = magnitude * amount_change

    if name == "Blue First" || name == "Blue Compare"
      self.quality = [quality + change, 50].min
    else
      self.quality = [quality - change, 0].max
    end
  end

  # Defining the amount that quality needs to be changed by based
  # on the name of the award
  def amount_change
    case self.name
    when "Blue Star"
      2
    when "Blue First"
      1
    when "Blue Compare"
      if expires_in < 5
        3
      elsif expires_in < 10
        2
      else
        1
      end
    else
      1
    end
  end

end

################ Legacy code ###################
=begin
Award = Struct.new(:name, :expires_in, :quality)
=end


