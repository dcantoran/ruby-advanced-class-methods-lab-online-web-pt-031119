class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end 
  
  def self.create_by_name(n_string)
    prop = self.create
    prop.name = n_string
    prop
  end 
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(name_str)
    c = self.new
    c.name = name_str
    c
  end
  
  def self.find_by_name(str_name)
    self.all.detect{|i| i.name == str_name}
  end 
  
  def self.find_or_create_by_name(str_name)
    if self.find_by_name(str_name) == nil 
      self.create_by_name(str_name)
    else 
      self.find_by_name(str_name)
    end
  end 
  
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end 
  
  def self.new_from_filename(song)
    c = song.split(' - ')
    nam = c[0][1].gsub(".mp3", "")
  end 
  
  
  
  
  def self.destroy_all
    self.all.clear
  end 
  
  
end
