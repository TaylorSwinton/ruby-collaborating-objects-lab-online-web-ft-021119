class MP3Importer

  attr_accessor :path, :found_files, :no_path_files

  def initialize(path)
    @path = path
  end

  def files
    #@found_files = Dir.entries(@path) #noramlizes the filename to just the mp3 filename with no path
    #@found_files = Dir.glob("#{@path}/*.mp3") #loads all the mp3 files in the path directory
    @files ||= Dir.entries(@path).select {|filename|!File.directory?(filename) && filename.end_with?(".mp3")}
  end

  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
