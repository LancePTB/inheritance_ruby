module Flight
  def fly
    puts "I'm a #{self.class.to_s}, I can fly!" if self.can_fly? 
  end
end

class Animal
  attr_reader :blood,:name, :legs, :arms, :wings, :hair

  def initialize(name)
    @name = name
  end

  def is_hairy?
    return true if hair
  end

  def can_fly?
    return true if wings
  end

  def warm_blooded?
    puts self.blood == "warm" ?  "I'm warm blooded!" : "I'm cold blooded!"
  end
end

class Mammal < Animal
  def initialize(name)
    super
    @blood = "warm"
  end
end

class Amphibian < Animal
  def initialize(name)
    super
    @blood = "cold"
  end
end

class Primate < Mammal
  def initialize(name)
    super
    @legs = 2
    hair = true
  end
end

class Frog < Amphibian
  def initialize(name)
    super
    @legs = 2
  end
end

class Bat < Mammal
include Flight
  def initialize(name)
    super
    @legs = 2
    @wings = true
  end
end

class Parrot < Animal
include Flight
  def initialize(name)
    super
    @legs = 2
    @wings = true
  end
end

class Chimpanzee < Primate
  def initialize(name)
    super
    @hair = true
  end
end

parrot = Parrot.new("Coco")
chimp = Chimpanzee.new("George")
bat = Bat.new("batman")
frog = Frog.new("wibit")

puts frog.warm_blooded?
puts bat.fly