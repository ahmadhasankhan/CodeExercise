json.array!(@rovers) do |rover|
  json.extract! rover, :id, :name, :position_x, :position_y, :direction
  json.url rover_url(rover, format: :json)
end
