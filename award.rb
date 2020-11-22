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

    case self.name
    when "Blue Star"
      self.quality -= 2
    when "Blue First"
      self.quality += 1
    when "Blue Compare"
      if expires_in < 5
        self.quality += 3
      elsif expires_in < 10
        self.quality += 2
      else
        self.quality += 1
      end
    else
      self.quality -= 1
    end

    quality_bounds

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


