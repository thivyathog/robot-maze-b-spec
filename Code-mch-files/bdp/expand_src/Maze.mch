/* Maze
 * Author: Thivya
 * Creation date: 11/17/2020
 */
MACHINE
    Maze
CONCRETE_CONSTANTS
    MazeX , MazeY , MazeArea , MazeBlocks , FreeSquare , MazeInitial , MazeFinal

PROPERTIES
    // The known space
    MazeX = 1 .. 7 &
   MazeY = 1 .. 5 &
    MazeArea = MazeX * MazeY &

    // Asteroids
    MazeBlocks <: MazeArea &

    MazeBlocks = { ( 1 |-> 3 ) , ( 2 |-> 1 ) , ( 2 |-> 3 ) , ( 2 |-> 5 ) , ( 3 |-> 3 ) , ( 4 |-> 2 ) , ( 4 |-> 3 ) , ( 4 |-> 4 ) , ( 6 |-> 1 ) , ( 6 |-> 2 ) , ( 6 |-> 4 ) , ( 7 |-> 4 ) } &



    // Empty Space
    FreeSquare <: MazeArea &
    FreeSquare /\ MazeBlocks = {} &
    FreeSquare \/ MazeBlocks = MazeArea &

    // Home base and Star Base
    MazeInitial : FreeSquare &
    MazeInitial : MazeArea &
    MazeInitial = 1 |-> 1 &

    MazeFinal : FreeSquare &
    MazeFinal : MazeArea &
    MazeFinal = 1 |-> 5

END
