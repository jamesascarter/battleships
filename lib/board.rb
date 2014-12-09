class Board

  attr_reader :grid

  DIMENSION = 10

  def initialize
    @grid = Array.new(DIMENSION).map! {Array.new(DIMENSION).map! {Cell.new}}
  end 

  def place_ship(ship, coordinate, direction)
      x, y = coord_converter(coordinate)
      ship.size.times do 
        put_ship_on_grid(ship, x, y)
        direction == "D" ? x += 1 : y += 1
      end
  end

  def put_ship_on_grid(ship, x, y)
    grid[x][y].ship = ship
    # grid[x][y].status = :occupied
  end

  def shoot_at(coordinates)
    x,y = coord_converter(coordinates)
    grid[x][y].incoming_shot
  end

	def coord_converter(coordinate)	
    [coordinate.split('', 2)[0].upcase.ord - 65, coordinate.split('', 2)[1].to_i - 1]
	end

  def board_fit?(ship, coordinate, direction)
    x, y = coord_converter(coordinate)
    return false if direction == "R" && (ship.size + x) > DIMENSION
    return false if direction == "D" && (ship.size + y) > DIMENSION
    true
  end

  def ship_clash? (ship, coordinate, direction)
    x, y = coord_converter(coordinate)
    ship.size.times do
      return true if grid[x][y].ship
      direction == "D" ? x += 1 : y += 1
    end
    false
  end
end