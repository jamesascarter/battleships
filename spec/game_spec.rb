require 'game'
require 'player'
require 'ship'
require 'board'

describe Game do 
	
		let(:game) {Game.new}
		let(:player1) {double :player1, Class: Player, board: [], place_ship: true, shoot_at: true, grid: []}
		let(:battleship) {double :battleship, name: :battleship}
		let(:STDIN) {double :STDIN}
		# let(:player2) {Player.new}
		let(:board) {Board.new}
 
	context "Upon initialize" do	

		it "should start with player 1" do
			expect(game.player1.class).to eq(Player)
		end

		it "should start with player 2" do
			expect(game.player2.class).to eq(Player)
		end
	end

	context "at beginning of game" do

		it "should ask player to place battleship" do
			expect(game.ask_player_place_ship(game.player1, battleship)).to eq("player1, where do you want to place your battleship (e.g. 'A1')")
		end	

		it "should ask player for direction" do
			expect(game.ask_player_ship_direction(game.player1, battleship)).to eq("player1, what direction do you want to place your battleship ('R' or 'D')")
		end

		it "should receive user input for coordinate" do
			allow(STDIN).to receive(:gets).and_return('A1')
			expect(game.coordinates).to eq("A1")
		end

		it "should receive user input for direction" do
			allow(STDIN).to receive(:gets).and_return('R')
			expect(game.direction).to eq("R")
		end

		it "should pass ship coordinates to board" do
			expect(player1.board).to receive(:place_ship).with(battleship, "A1", "R")
			game.pass_coordinates(player1, battleship, "A1", "R")
		end
	end

	context "during the game" do

		it "should ask player to give shooting coordinate" do
			expect(game.ask_player_shoot(game.player1)).to eq(puts "player1, where do you want to shoot? (e.g. 'A1')")
		end

		it "should receive user input for shooting coordinate" do
			allow(STDIN).to receive(:gets).and_return('A1')
			expect(game.direction).to eq("A1")
		end

		it "should pass shooting coordinate to board" do
			allow(player1.board).to receive(:shoot_at).with ("A1")
			expect(player1.board).to receive(:shoot_at).with("A1")
			game.pass_shot(player1, "A1")
		end

		it "should report if shot is miss" do
			expect(game.pass_shot(game.player2, "D3")).to eq(:miss)
		end

		it "should report if shot is hit" do
			game.pass_coordinates(game.player2, game.player2.battleship, "D3", "D")
			expect(game.pass_shot(game.player2, "D3")).to eq(:hit)
		end

		# it "should report if patrolboat is sunk" do
		# 	game.pass_coordinates(game.player2, game.player2.patrolboat, "A1", "D")
		# 	game.pass_shot(game.player2, "A1")
		# 	game.pass_shot(game.player2, "A2")
		# 	expect(game.check_sunk(game.player2, game.player2.patrolboat)).to be true
		# end

		it "should report end of game if all ships are sunk" do
			# tested in IRB. F*cking rebels
		end


	end

	
end

# def place_ship(ship, coordinate, direction)
