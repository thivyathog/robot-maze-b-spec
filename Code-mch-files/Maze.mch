/* Maze
 * Author: Thivya
 * Creation date: 11/17/2020
 */
MACHINE
    Maze
CONSTANTS
    MazeX, MazeY, MazeArea, MazeBlocks, FreeSquare, MazeInitial, MazeFinal
    
PROPERTIES
    // maze space
 
    MazeX = 1..7 &
    MazeY = 1..5 &
    MazeArea = MazeX * MazeY &
    
    // Blocks on the Maze
    MazeBlocks <: MazeArea &

    MazeBlocks = {(1 |-> 3), (2 |-> 1), (2 |-> 3), (2 |-> 5), (3 |-> 3), (4 |-> 2), (4 |-> 3), (4 |-> 4), (6 |-> 1), (6 |-> 2), (6 |-> 4), (7 |-> 4)} &
 

    
    // Free Space
    FreeSquare <: MazeArea &
    FreeSquare /\ MazeBlocks = {} &
    FreeSquare \/ MazeBlocks = MazeArea &
    
    // Intial Maze Square and Final Maze Square 
    MazeInitial : FreeSquare &
    MazeInitial : MazeArea &
    MazeInitial = 1|->1 &
    
    MazeFinal : FreeSquare &
    MazeFinal : MazeArea &
    MazeFinal = 1|->5
    
END

