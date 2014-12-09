require_relative 'grid_print'

class Player

	attr_accessor :patrolboat, :battleship, :submarine, :aircraftcarrier, :destroyer
	attr_accessor :ships, :board, :name, :tracking_board

	
	include GridPrint

	def initialize(name="Unknown player")
		@board = Board.new
		@tracking_board = Board.new
		@patrolboat = Ship.patrolboat
		@battleship = Ship.battleship
		@submarine = Ship.submarine
		@aircraftcarrier = Ship.aircraftcarrier
		@destroyer = Ship.destroyer
		@ships = [patrolboat, battleship, submarine, aircraftcarrier, destroyer]
		@name = name
	end
end


