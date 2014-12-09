
##CRC Modelling

###Player (ship, board)
-------------------
* has boards
* has ships?
* places ships on board
* shoots at the board

###Ship (board, player, cell)
---------------------------
* can be hit 			
* can sink 				

###Cell (ship, board)
--------------------
* knows if it has a ship 				   
* knows when it is shot but empty (miss)  
* knows when it is shot and has a ship (hit) 
* knows if it is empty 

###Board (player, cell, ship)
---------------------------
* has cells and knows their coordinates
* has to validate coordinates
* reports victory
* displays when a ship is sunk
* checks and tells a cell when it is hit
* checks and tells a cell when it it has a ship
* displays a hit
* displays a miss



##List of Methods

###Cell
-----------

*initialize*

@occupied?

@shot?




###Player
-----------




###Ship
-----------
receive_shot

sunk?
 
#####Types of boats (hit_count = 0)
* aircraftcarrier (size = 5)
* battleship (size = 4)
* submarine (size = 3)
* destroyer (size = 3) 
* patrolboat (size = 2)


###Board
-----------



