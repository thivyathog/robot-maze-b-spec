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
    movedDirections := <>


OPERATIONS

  toast_notification <-- moveNorth =

    PRE
        not ( ( xPosition |-> yPosition = MazeFinal ) ) & ( xPosition |-> yPosition : MazeArea )
    THEN
        IF
            ( xPosition |-> yPosition + 1 : FreeSquare ) &  ( xPosition |-> yPosition + 1 : MazeArea )

        THEN

            yPosition := yPosition + 1 ||

            visitedMazeSquares := visitedMazeSquares <- ( xPosition |-> yPosition ) ||

            toast_notification := SUCESSFULL_MOVE ||

            movedDirections := movedDirections <- NORTH

        ELSIF
            ( xPosition |-> yPosition + 1 : MazeBlocks )

        THEN
            toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE

        ELSE
             toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE

            END
        END ;



  toast_notification <-- moveSouth =

    PRE
         not ( ( xPosition |-> yPosition = MazeFinal ) ) & ( xPosition |-> yPosition : MazeArea )
    THEN

        IF
            ( xPosition |-> yPosition - 1 : FreeSquare )  &  ( xPosition |-> yPosition - 1 : MazeArea )

        THEN
            yPosition := yPosition - 1 ||

            visitedMazeSquares := visitedMazeSquares <- ( xPosition |-> yPosition ) ||

            toast_notification := SUCESSFULL_MOVE ||

            movedDirections := movedDirections <- SOUTH

        ELSIF
                ( xPosition |-> yPosition - 1 : MazeBlocks )

        THEN
                toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE
        ELSE
                toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE

        END

  END ;

  toast_notification <-- moveEast =

    PRE
         not ( ( xPosition |-> yPosition = MazeFinal ) ) & ( xPosition |-> yPosition : MazeArea )
    THEN
        IF
            ( xPosition + 1 |-> yPosition : FreeSquare )  &  ( xPosition + 1 |-> yPosition : MazeArea )

        THEN
            xPosition := xPosition + 1 ||

            visitedMazeSquares := visitedMazeSquares <- ( xPosition |-> yPosition ) ||

            toast_notification := SUCESSFULL_MOVE ||

            movedDirections := movedDirections <-  EAST

        ELSIF
                ( xPosition + 1 |-> yPosition : MazeBlocks )

        THEN
                toast_notification := INTERNALBLOCKDETECTED_CANNOT_MOVE
        ELSE
                 toast_notification := EXTERNALWALLDETECTED_CANNOT_MOVE


        END
  END ;

  toast_notification <-- moveWest =

    PRE
        not ( ( xPosition |-> yPosition = MazeFinal ) ) & ( xPosition |-> yPosition : MazeArea )
    THEN
        IF
           ( xPosition - 1 |-> yPosition : FreeSquare )  &  ( xPosition - 1 |-> yPosition : MazeArea )

        THEN

        xPosition := xPosition - 1 ||

        visitedMazeSquares := visitedMazeSquares <- ( xPosition |-> yPosition ) ||

        toast_notification := SUCESSFULL_MOVE ||

         movedDirections := movedDirections <- WEST

        ELSIF
            ( xPosition - 1 |-> yPosition : MazeBlocks )
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
        ( xPosition |-> yPosition = MazeFinal )
    THEN

    xPosition := prj1 ( MazeX , MazeY ) ( MazeInitial ) ||
    yPosition := prj2 ( MazeX , MazeY ) ( MazeInitial ) ||
    visitedMazeSquares := [ MazeInitial ] ||
    movedDirections := <>
    END ;

 /** Reports whether the space ship is docked at the star base **/
  foundExitSquare <-- foundExit =
    PRE
        foundExitSquare : EXIT_STATUS
    THEN
        IF
            ( ( xPosition |-> yPosition = MazeFinal ) )
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
        not ( ( xPosition |-> yPosition = MazeFinal ) ) &
        newXTeleport : MazeX &
        newYTeleport : MazeY
     THEN

        IF
           ( newXTeleport |-> newYTeleport : FreeSquare )

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
                                                not ( ( newXTeleport |-> newYTeleport : MazeBlocks ) )
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
