/* Robot
 * Author: Thivya
 * Creation date: 11/17/2020
 */

MACHINE
    Robot
SEES
    Maze

SETS
    TOAST_NOTIFICATION = {
       SUCESSFULL_MOVE ,
       INTERNALBLOCKDETECTED_CANNOT_MOVE ,
       EXTERNALWALLDETECTED_CANNOT_MOVE ,
       TELEPORTATION_SUCESSFULL ,
       TELEPORTTOSAMEWALLS_DENIED ,
       TELEPORTTOINTERNALWALLS_DENIED ,
       TELEPORTTOEXITATSTART_DENIED ,
       UNSUCCESSFUL_MOVE } ;
    IS_VISITED = { YES , NO } ;
    EXIT_STATUS = { Yes , No } ;
    MOVEMENT_DIRECTIONS = { NORTH , SOUTH , EAST , WEST , TELEPORT }

DEFINITIONS
    isWithinfreeSquare ( xx , yy ) == ( xx |-> yy : FreeSquare ) ;
    isMovedtoMazeBlock ( xx , yy ) == ( xx |-> yy : MazeBlocks ) ;
    isInMazeBoundary ( xx , yy ) == ( xx |-> yy : MazeArea ) ;
    isFinished ==  ( xPosition |-> yPosition = MazeFinal ) ;


    /** ANIMATION **/

    ANIMATION_FUNCTION_DEFAULT == ( { rr , cc , ii | rr : MazeY & cc : MazeX &
            ( IF ( cc = prj1 ( MazeX , MazeY ) ( MazeInitial ) & rr = prj2 ( MazeX , MazeY ) ( MazeInitial ) )
                THEN
                    // Star base
                    ii = 3
                ELSE
                    IF ( cc |-> ( 6 - rr ) : MazeBlocks )
                    THEN
                        // Asteroid

                        ii = 1
                    ELSE
                        IF ( cc = xPosition & rr = ( 6 - yPosition ) )
                        THEN
                            // Spaceship
                            ii = 2
                        ELSE
                            // Empty space
                            ii = 0
                        END
                    END

    END ) } ) ;

    ANIMATION_IMG0 == "images/maze.gif" ;
    ANIMATION_IMG1 == "images/block.gif" ;
    ANIMATION_IMG2 == "images/robot.gif" ;
    ANIMATION_IMG3 == "images/winning.gif" ;
    ANIMATION_IMG4 == "images/spaceship.gif" ;
    ANIMATION_IMG5 == "images/cross.gif" ;
    ANIMATION_IMG6 == "images/finalrobot.gif" ;

  ANIMATION_FUNCTION2 == ( { rr , cc , ii | ( cc = xPosition & rr = ( 6 - yPosition ) ) & isFinished & ii = 6
 } ) ;

 ANIMATION_FUNCTION3 == ( { rr , cc , ii | cc |-> ( 6 - rr ) : ran ( visitedMazeSquares ) & isFinished & ii = 5
 } ) ;

ABSTRACT_VARIABLES
   visitedMazeSquares ,
   xPosition ,
   yPosition ,
   movedDirections


INVARIANT

    xPosition : MazeX &
    yPosition : MazeY &
    xPosition : NATURAL1 &
    yPosition : NATURAL1 &
    xPosition |-> yPosition : FreeSquare &
    visitedMazeSquares : seq ( FreeSquare ) &
    movedDirections : seq ( MOVEMENT_DIRECTIONS )

INITIALISATION

    xPosition := prj1 ( MazeX , MazeY ) ( MazeInitial ) ||
    yPosition := prj2 ( MazeX , MazeY ) ( MazeInitial ) ||
    visitedMazeSquares := [ MazeInitial ] ||
    movedDirections := []


OPERATIONS

  toast_notification <-- moveNorth =

    PRE
        not ( isFinished ) & isInMazeBoundary ( xPosition , yPosition )
    THEN
        IF
            isWithinfreeSquare ( xPosition , yPosition + 1 ) & isInMazeBoundary ( xPosition , yPosition + 1 )

        THEN

            yPosition := yPosition + 1 ||

            visitedMazeSquares := visitedMazeSquares <- ( xPosition |-> yPosition ) ||

            toast_notification := SUCESSFULL_MOVE ||

            movedDirections := movedDirections <- NORTH

        ELSIF
            isMovedtoMazeBlock ( xPosition , yPosition + 1 )

        THEN
            toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE

        ELSE
             toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE

            END
        END ;



  toast_notification <-- moveSouth =

    PRE
         not ( isFinished ) & isInMazeBoundary ( xPosition , yPosition )
    THEN

        IF
            isWithinfreeSquare ( xPosition , yPosition - 1 ) & isInMazeBoundary ( xPosition , yPosition - 1 )

        THEN
            yPosition := yPosition - 1 ||

            visitedMazeSquares := visitedMazeSquares <- ( xPosition |-> yPosition ) ||

            toast_notification := SUCESSFULL_MOVE ||

            movedDirections := movedDirections <- SOUTH

        ELSIF
                isMovedtoMazeBlock ( xPosition , yPosition - 1 )

        THEN
                toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE
        ELSE
                toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE

        END

  END ;

  toast_notification <-- moveEast =

    PRE
         not ( isFinished ) & isInMazeBoundary ( xPosition , yPosition )
    THEN
        IF
            isWithinfreeSquare ( xPosition + 1 , yPosition ) & isInMazeBoundary ( xPosition + 1 , yPosition )

        THEN
            xPosition := xPosition + 1 ||

            visitedMazeSquares := visitedMazeSquares <- ( xPosition |-> yPosition ) ||

            toast_notification := SUCESSFULL_MOVE ||

            movedDirections := movedDirections <-  EAST

        ELSIF
                isMovedtoMazeBlock ( xPosition + 1 , yPosition )

        THEN
                toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE
        ELSE
                 toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE


        END
  END ;

  toast_notification <-- moveWest =

    PRE
        not ( isFinished ) & isInMazeBoundary ( xPosition , yPosition )
    THEN
        IF
           isWithinfreeSquare ( xPosition - 1 , yPosition ) & isInMazeBoundary ( xPosition - 1 , yPosition )

        THEN

        xPosition := xPosition - 1 ||

        visitedMazeSquares := visitedMazeSquares <- ( xPosition |-> yPosition ) ||

        toast_notification := SUCESSFULL_MOVE ||

         movedDirections := movedDirections <- WEST

        ELSIF
            isMovedtoMazeBlock ( xPosition - 1 , yPosition )
        THEN
            toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE
        ELSE
             toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE


        END
  END ;

    /** Gives the route that the robot has travelled through **/
  route <-- getRobotRoute =
    BEGIN
        route := visitedMazeSquares
    END ;


    /** Resets the game, and starts again from the beginning **/
  resetMazeRobot =
    PRE
        isFinished
    THEN

    xPosition := prj1 ( MazeX , MazeY ) ( MazeInitial ) ||
    yPosition := prj2 ( MazeX , MazeY ) ( MazeInitial ) ||
    visitedMazeSquares := [ MazeInitial ] ||
    movedDirections := []
    END ;

 /** Reports whether the space ship is docked at the star base **/
  foundExitSquare <-- foundExit =
    PRE
        foundExitSquare : EXIT_STATUS
    THEN
        IF
            ( isFinished )
        THEN
            foundExitSquare := Yes
        ELSE
            foundExitSquare := No
        END
    END ;



    /** Gives the current status of the space ship **/
    currentLocation <-- getRobotCurrentPosition =
    BEGIN
        currentLocation := xPosition |-> yPosition
    END ;

        /** Gives all movements taken by the space ship **/
    allMovements <-- directionsTaken =
    BEGIN
        allMovements := movedDirections
    END ;


  teleportMessage  <-- teleport ( newXTeleport , newYTeleport ) =
     PRE
        not ( isFinished ) &
        newXTeleport : MazeX &
        newYTeleport : MazeY
     THEN

        IF
           isWithinfreeSquare ( newXTeleport , newYTeleport )

        THEN
                           IF ( newXTeleport = xPosition & newYTeleport = yPosition )
                                THEN
                                            teleportMessage :=   TELEPORTTOSAMEWALLS_DENIED
                                ELSE
                                    IF
                                                ( size ( visitedMazeSquares ) = 1 & newXTeleport |-> newYTeleport = MazeFinal )
                                   THEN
                                                   teleportMessage :=    TELEPORTTOEXITATSTART_DENIED

                                   ELSE

                                       IF
                                                not ( isMovedtoMazeBlock ( newXTeleport , newYTeleport ) )
                                       THEN
                                             xPosition := newXTeleport ||
                                            yPosition := newYTeleport ||
                                            visitedMazeSquares := visitedMazeSquares <- ( xPosition |-> yPosition ) ||
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
  END ;

  isVisited  <-- visitedSquare ( xPost , yPost ) =
       PRE
           xPost : MazeX &
           yPost : MazeY
       THEN
           IF
           ( xPost |-> yPost : ran ( visitedMazeSquares ) )
           THEN
           isVisited := YES
           ELSE
           isVisited := NO
           END

       END

   END
