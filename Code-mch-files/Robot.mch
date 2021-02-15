/* Robot
 * Author: Thivya
 * Creation date: 11/17/2020
 */

MACHINE
    Robot
SEES 
    Maze

SETS
    TOAST_NOTIFICATION= { 
       SUCESSFULL_MOVE, 
       INTERNALBLOCKDETECTED_CANNOT_MOVE,
       EXTERNALWALLDETECTED_CANNOT_MOVE,
       TELEPORTATION_SUCESSFULL,
       TELEPORTTOSAMEWALLS_DENIED,
       TELEPORTTOINTERNALWALLS_DENIED,
       TELEPORTTOEXITATSTART_DENIED,
       UNSUCCESSFUL_MOVE } ;
    BOOLEAN_SET= { YES, NO} ;
    MOVEMENT_DIRECTIONS = { NORTH, SOUTH,EAST ,WEST,TELEPORT }
    
DEFINITIONS
    isWithinfreeSquare(xx, yy) == (xx |-> yy :FreeSquare);
    isMovedtoMazeBlock(xx, yy) == (xx |-> yy : MazeBlocks);
    isInMazeBoundary(xx,yy) == (xx |-> yy :MazeArea);
    isFinished ==  (xPosition |-> yPosition = MazeFinal);


    /** ANIMATION **/
  
    ANIMATION_FUNCTION_DEFAULT == ({rr,cc,ii | rr:MazeY & cc:MazeX &            
            (IF (cc = prj1(MazeX, MazeY)(MazeInitial) & rr = prj2(MazeX, MazeY)(MazeInitial))
                THEN
                    // MazeInitial
                    ii = 3
                ELSE
                    IF (cc |-> (6 - rr) : MazeBlocks)
                    THEN
                        // Blocks
		
                        ii = 1
                    ELSE
                        IF (cc = xPosition & rr = (6 - yPosition))
                        THEN
                            // robot
                            ii = 2
                        ELSE
                            // Empty square
                            ii = 0
                        END
                    END

    END)});

    ANIMATION_IMG0 == "images/maze.gif";
    ANIMATION_IMG1 == "images/block.gif";
    ANIMATION_IMG2 == "images/robot.gif";
    ANIMATION_IMG3 == "images/winning.gif";
    ANIMATION_IMG4 == "images/spaceship.gif";
    ANIMATION_IMG5 == "images/cross.gif";
    ANIMATION_IMG6 == "images/finalrobot.gif";

  ANIMATION_FUNCTION2 == ({rr,cc,ii |  (cc = xPosition & rr = (6 - yPosition)) &  isFinished& ii = 6
 });
 
  /** ANIMATION FOR VISITED SQUARES **/
 ANIMATION_FUNCTION3 == ({rr,cc,ii | cc |-> (6 - rr) : ran(visitedMazeSquares)&  isFinished & ii = 5
 });
 
VARIABLES
   visitedMazeSquares,
   xPosition,
   yPosition,
   movedDirections

    
INVARIANT

    xPosition : MazeX &
    yPosition : MazeY &
    xPosition : NATURAL1 &
    yPosition : NATURAL1 &
    xPosition |-> yPosition : FreeSquare &
    visitedMazeSquares : seq(FreeSquare) &
    movedDirections : seq(MOVEMENT_DIRECTIONS)

INITIALISATION
    
    xPosition := prj1(MazeX, MazeY)(MazeInitial) ||
    yPosition := prj2(MazeX, MazeY)(MazeInitial) ||
    visitedMazeSquares := [MazeInitial] ||
    movedDirections := []
    

OPERATIONS
  
  /* Moves the Robot North - Checks for the following set constraints
 * 1. Moved square is not a Blocked Square
 * 2. Moved square is not outside the border of the wall
 * 3. Checks if the robot has reached final Square
 
 */
  
  toast_notification <-- moveNorth =
    
    PRE 
        not(isFinished)  &  isInMazeBoundary(xPosition, yPosition) 
    THEN
        IF
            isWithinfreeSquare(xPosition, yPosition + 1) &  isInMazeBoundary(xPosition, yPosition + 1) 
    
        THEN
    
            yPosition := yPosition + 1 ||
        
            visitedMazeSquares := visitedMazeSquares <- (xPosition |-> yPosition) ||
        
            toast_notification := SUCESSFULL_MOVE ||
            
            movedDirections := movedDirections <- NORTH
    
        ELSIF 
            isMovedtoMazeBlock(xPosition, yPosition + 1)

        THEN
            toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE 
            
        ELSE
             toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE 
    
            END 
        END;
  
 /* Moves the Robot South - Checks for the following set constraints
 * 1. Moved square is not a Blocked Square
 * 2. Moved square is not outside the border of the wall
 * 3. Checks if the robot has reached final Square
 
 */
    
  toast_notification <-- moveSouth =
  
    PRE 
         not(isFinished)&  isInMazeBoundary(xPosition, yPosition) 
    THEN
    
        IF
            isWithinfreeSquare(xPosition, yPosition - 1)  &  isInMazeBoundary(xPosition, yPosition - 1) 
    
        THEN
            yPosition := yPosition - 1 ||
        
            visitedMazeSquares := visitedMazeSquares <- (xPosition |-> yPosition) ||
        
            toast_notification := SUCESSFULL_MOVE ||
        
            movedDirections := movedDirections <- SOUTH

        ELSIF 
                isMovedtoMazeBlock(xPosition, yPosition -1)
            
        THEN
                toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE 
        ELSE
                toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE 
    
        END 
        
  END ;  

 /* Moves the Robot East - Checks for the following set constraints
 * 1. Moved square is not a Blocked Square
 * 2. Moved square is not outside the border of the wall
 * 3. Checks if the robot has reached final Square
 
 */
  toast_notification <-- moveEast =
  
    PRE 
         not(isFinished)  &  isInMazeBoundary(xPosition, yPosition) 
    THEN
        IF
            isWithinfreeSquare(xPosition + 1, yPosition ) &  isInMazeBoundary(xPosition +1, yPosition ) 
    
        THEN
            xPosition := xPosition + 1 ||
        
            visitedMazeSquares := visitedMazeSquares <- (xPosition |-> yPosition) ||
        
            toast_notification := SUCESSFULL_MOVE ||
            
            movedDirections := movedDirections <-  EAST
    
        ELSIF 
                isMovedtoMazeBlock(xPosition +1, yPosition )
            
        THEN
                toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE 
        ELSE
                 toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE 
    
              
        END
  END ;  

 /* Moves the Robot West - Checks for the following set constraints
 * 1. Moved square is not a Blocked Square
 * 2. Moved square is not outside the border of the wall
 * 3. Checks if the robot has reached final Square
 
 */
  toast_notification <-- moveWest =
  
    PRE 
        not(isFinished) &  isInMazeBoundary(xPosition, yPosition) 
    THEN
        IF
           isWithinfreeSquare(xPosition - 1, yPosition ) &  isInMazeBoundary(xPosition -1, yPosition ) 
    
        THEN
            
        xPosition := xPosition - 1 ||
        
        visitedMazeSquares := visitedMazeSquares <- (xPosition |-> yPosition) ||
        
        toast_notification := SUCESSFULL_MOVE ||
        
         movedDirections := movedDirections <- WEST
  
        ELSIF 
            isMovedtoMazeBlock(xPosition-1, yPosition )
        THEN
            toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE 
        ELSE
             toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE 
     

        END
  END;

    /** Gives the route that the robot has travelled through **/
  route <-- getRobotRoute =
    BEGIN
        route := visitedMazeSquares
    END;


    /** Resets the game, and starts again from the beginning **/
  resetMazeRobot =
    PRE
        isFinished
    THEN
       
    xPosition := prj1(MazeX, MazeY)(MazeInitial) ||
    yPosition := prj2(MazeX, MazeY)(MazeInitial) ||
    visitedMazeSquares := [MazeInitial] ||
    movedDirections := []
    END;

 /** Reports whether the robot has reached the Exit Maze Block **/
  foundExitSquare <-- foundExit =
    PRE
        foundExitSquare : BOOLEAN_SET
    THEN
        IF
            (isFinished)
        THEN
            foundExitSquare := YES
        ELSE
            foundExitSquare := NO
        END
    END;



    /** Gives the current status of the robot **/
    currentLocation <-- getRobotCurrentPosition=
    BEGIN
        currentLocation := xPosition |-> yPosition 
    END;

        /** Gives all movements taken by robot **/
    allMovements <-- directionsTaken=
    BEGIN
        allMovements := movedDirections 
    END;
  
  /* Attempts to Teleport the Robot - Checks for the following set constraints
 * 1. X and Y within range of the border wall
 * 2. X and Y not a element of Blocked square AND
 * 3. Not in the starting square OR ending square 
 * 4. Cannot teleport to same square
 */
    
  teleportMessage  <-- teleport(newXTeleport, newYTeleport)  =
     PRE
        not(isFinished)  &
        newXTeleport : MazeX &
        newYTeleport : MazeY 
     THEN
   
        IF
           isWithinfreeSquare(newXTeleport, newYTeleport)
        
        THEN
          		 IF(newXTeleport = xPosition & newYTeleport = yPosition)
               		 THEN
                  			  teleportMessage :=   TELEPORTTOSAMEWALLS_DENIED
              		  ELSE
              		      IF 
                        			(size(visitedMazeSquares) = 1 & newXTeleport|->newYTeleport = MazeFinal)
		                   THEN
                         			  teleportMessage :=    TELEPORTTOEXITATSTART_DENIED

		                   ELSE 
		                      
		                       IF
 			                       not(isMovedtoMazeBlock(newXTeleport , newYTeleport))
		                       THEN
        	  	                   xPosition := newXTeleport ||
           		                 yPosition := newYTeleport ||
      		                      visitedMazeSquares := visitedMazeSquares <- (xPosition |-> yPosition) ||
        		                   teleportMessage := TELEPORTATION_SUCESSFULL ||
                                movedDirections := movedDirections <- TELEPORT
     
   		                    ELSE
        		                  teleportMessage := TELEPORTTOINTERNALWALLS_DENIED
		
     
                            END
                        END
                    END
            ELSE 
                teleportMessage := TELEPORTTOINTERNALWALLS_DENIED
      END
  END;

/* Get to see whether the square is visited by robot or not.
 * Pre conditions are the inputs should be within the border.
 * if its true then we get the range if 
 */
 
  isVisited  <-- visitedSquare(xPost, yPost)  =
       PRE    
           xPost : MazeX &
           yPost : MazeY
       THEN
           IF
           (xPost |-> yPost : ran(visitedMazeSquares)) 
           THEN
           isVisited := YES
           ELSE
           isVisited := NO
           END
       
       END

   END
