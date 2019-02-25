class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    array = filename.split(/[-.]/)
    @artist = array[0].strip
    @song_name = array[1].strip
    @song = Song.new(@song_name)
    @artist= Artist.find_or_create_by_name(@artist)
    @artist.save
    @artist.add_song(@song)
    @song.artist =@artist
    @song
  end

end
