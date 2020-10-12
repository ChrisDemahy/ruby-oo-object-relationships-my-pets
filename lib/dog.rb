# Describes an Dog
class Dog
  ### CLASS DEFINITIONS ###

  # class variables
  @@all = []

  def self.all
    @@all
  end

  def self.sell_dogs(owner)
    @@all.delete_if do |dog|
      dog.owner == owner
    end
  end

  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor  :owner, :mood
  attr_reader :name

  # default constructor
  def initialize(name=nil, owner=nil)
    @name = name
    self.owner = owner
    self.mood = "nervous"
    self.save
  end

  # save the instance to the class variable all
  def save
    self.class.all << self
  end

  # Walks the dog and makes it happy
  def walk
    self.mood = "happy"
  end

  # Sells the dog and makes it nervous
  def sell
    self.mood = "nervous"
    self.owner = nil
  end


end