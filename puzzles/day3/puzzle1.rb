require 'set'

claims = File.read('input.txt').lines
coords = Set.new
overlaps = Set.new
# #irrelevant @ start_x,start_y: width, height
claims.each do |claim|
  start_coords = claim.split(':')[0].split[2].split(',').map(&:to_i)
  start_x = start_coords.first + 1
  start_y = start_coords.last + 1
  dimens = claim.split[3].split('x').map(&:to_i)
  width = dimens.first
  height = dimens.last
  end_x = start_x + width - 1
  end_y = start_y + height - 1
  (start_y..end_y).each do |h|
    (start_x..end_x).each do |w|
      coord = [w, h]
      overlaps.add(coord) unless coords.add?(coord)
    end
  end
end
puts "Total overlapping square inches: #{overlaps.length}"
