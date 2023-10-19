def save_data(filename, data_array)
  json_data = JSON.generate(data_array)

  File.write(filename, json_data)
  puts 'Data saved to file successfully.'
end

def read_data(filename)
  if File.exist?(filename) && File.size(filename) != 0
    json_data = File.read(filename)
    JSON.parse(json_data)
  else
    []
  end
end
