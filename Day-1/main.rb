path = File.read('input.txt').split(' ').map(&:strip)

# SETTING INSTANCE VARIABLES

@coordinates_array = ['N', 'E', 'S', 'W']
@facing = 'N'
@x = 0
@y = 0

# example_1 = ['R2', 'L3']
# example_2 = ['R2', 'R2', 'R2']
# example_3 = ['R5, 'L5', 'R5', 'R3']

# CHANGING THE DIRECTION BASED ON THE STARTING DIRECTION (N)

def turn_right
  @coordinates_array.push(@coordinates_array.shift)
  @facing = @coordinates_array[0]
end

def turn_left
  @coordinates_array.prepend(@coordinates_array.pop)
  @facing = @coordinates_array[0]
end

# UPDATING COORDINATES BASED ON THE DIFFERENT DIRECTIONS

def update_coordinates(distance)
  if @facing == 'N'
    @y += distance
  elsif @facing == 'E'
    @x += distance
  elsif @facing == 'S'
    @y -= distance
  else
    @x -= distance
  end
end

# GETTING THE INPUT AND CALCULATING THE DISTANCE FROM THE EASTER BUNNY

def movements(direction)
  direction.each do |step|
    if step[0] == 'R'
      turn_right
    else
      turn_left
    end
    distance = step[1..-1].to_i
    update_coordinates(distance)
  end

  easter_bunny_hq = @x.abs + @y.abs

  puts "Easter Bunny HQ is #{easter_bunny_hq} blocks away"

  easter_bunny_hq
end

movements(path)
