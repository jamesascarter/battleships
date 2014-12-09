class Game
	

	def initialize(player1="player1", player2="player2")
		@player1 = Player.new(player1)
		@player2 = Player.new(player2)
	end

	def player1
		@player1
	end

	def player2
		@player2
	end

	def players
		[@player1, @player2]
	end

	def ask_player_place_ship(player, ship)
		"#{player.name}, where do you want to place your #{ship.name} (e.g. 'A1')"

	end	

	def coordinates
		coordinates = STDIN.gets.chomp
	end

	def ask_player_ship_direction(player, ship)
		"#{player.name}, what direction do you want to place your #{ship.name} ('R' or 'D')"
	end

	def ask_player_shoot(player)
		puts "#{player.name}, where do you want to shoot? (e.g. 'A1')"
	end

	def direction
		direction = STDIN.gets.chomp
	end

	def pass_coordinates(player, ship, coordinate, direction)
		player.board.place_ship(ship, coordinate, direction)
	end

	def pass_shot(player, coordinate)
		return player.board.shoot_at(coordinate)
	end

	def check_sunk(player)
		player.ships.each do |ship|
			puts "#{ship.name} sunk status is #{ship.sunk?}"
		end
		return "GAME OVER" if game_over?
	end

	def game_over?
		player.patrolboat.sunk? && player.submarine.sunk? && player.battleship.sunk? && player.aircraftcarrier.sunk? && player.destroyer.sunk?	
	end

	def player1_move
		# player2.print_boards(player2.tracking_board)	
		ask_player_shoot(player1)
		target = coordinates
		pass_shot(player2, target)
		check_sunk(player2)
	end

	def player2_move
		# player1.print_boards(player1.tracking_board)	
		ask_player_shoot(player2)
		target = coordinates
		pass_shot(player1, target)
		check_sunk(player1)
	end

	# def play
	# 	until game_over? 
	# 	player1_move
	# 	player2_move
	# end


end

# def play_game(game_number)
	# game = Game.new
	# Game goes into deployment phase ...
	# game.players.each do |player|
	# 	# player.ships.each do |ship|
	# 	# 	ask_player_place_ship(player, ship)
	# 	# 	ship_coordinates = gets.chomp
	# 	# 	board_fit?
	# 	# 	ship.clash?
	# 	# 	player.board.place_ship(ship, ship_coordinates)
	# 	end
	# end

	#Board populated with ships, game starts


	


