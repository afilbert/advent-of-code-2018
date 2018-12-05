require 'set'

claims = File.read('input.txt').lines
coords = Set.new
overlaps = Set.new
all_tags = Set.new
overlapped_tags = Set.new
# #ID @ start_x,start_y: width, height
(1..2).each do |_i|
  claims.each do |claim|
    # First pass, find second-time overlap ids
    # Second pass adds first-time overlap ids
    id_tag = claim.split(':')[0].split[0].split('#')[1]
    all_tags.add(id_tag)
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
        unless coords.add?(coord)
          overlapped_tags.add(id_tag) unless overlaps.add?(coord)
        end
      end
    end
  end
end
puts "Our prize-winning ID: #{(all_tags - overlapped_tags).first}"
