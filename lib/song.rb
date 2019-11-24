class Song 
  
  attr_accessor :name,:artist
  attr_reader  :genre
  @@all = []
  
  def initialize(name, artist_obj = nil, genre_obj = nil )
    @name = name 
    @artist = artist_obj
    @genre = genre_obj
    self.artist = artist_obj if artist_obj
    self.genre = genre if genre
    
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
  
  def self.create(song_name)
    song_obj = self.new(song_name)
    song_obj.save 
    song_obj
  end
    
  def artist=(artist_obj)
    @artist = artist_obj
    artist_obj.add_song(self)
  end 
    
def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
def self.find_by_name(name)
   all.detect{ |s| s.name == name }
end

def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
     new(song_name, artist, genre)
end 

def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save }
  end


end