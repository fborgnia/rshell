class Ls

  def initialize(path=".")
    @files = Dir.entries(path)
  end

  def to_s
    puts "toma tus archivos"
    puts @files
  end

end