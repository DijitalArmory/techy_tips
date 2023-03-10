  GNU nano 4.8                                     cat.rb                                               
filename = ARGV[0]

if File.exist?(filename)
  File.open(filename, "r") do |file|
    puts file.read
  end
else
  puts "File not found."
end
