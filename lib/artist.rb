class Artist  
   extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs, :genres
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = [] 
    
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all 
    self.all.clear 
  end 
  
  def save
    @@all << self
  end 
  
  def self.create(artist_name)
    artist_obj = self.new(artist_name)
    artist_obj.save 
    artist_obj
  end
  
  def add_song(song_obj)
    song_obj.artist = self unless song_obj.artist != nil
    
    @songs << song_obj unless @songs.include? song_obj
  end
  
  def genres
    songs.collect{ |s| s.genre }.uniq
  end
    
    
    
    
end