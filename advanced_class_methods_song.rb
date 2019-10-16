#Learning Goals
#Build custom class constructors.
#Build class finders.
#Build class operators
class Song
  attr_accessor :name, :artist_name
  @@all = [] #this is where all instances for Song are saved

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #this method initializes a song and saves it the @@all class variable
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name) #this method takes in the string name of a song and returns a song instance with that name set as its property
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)  #takes in the string name and returns a songe instance with that name set as its name propert and the song is saved into @@all
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find(|song| song.name == name)
  end

  def self.find_or_create_by_name(name)
    self.find_by_name || self.create_by_name
  end

  def self.alphabetical()
    @@all.sort_by{|song| song.name}
  end

end
