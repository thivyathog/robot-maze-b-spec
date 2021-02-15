Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Robot))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Robot))==(Machine(Robot));
  Level(Machine(Robot))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Robot)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Robot))==(Maze)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Robot))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Robot))==(?);
  List_Includes(Machine(Robot))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Robot))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Robot))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Robot))==(?);
  Context_List_Variables(Machine(Robot))==(?);
  Abstract_List_Variables(Machine(Robot))==(?);
  Local_List_Variables(Machine(Robot))==(movedDirections,yPosition,xPosition,visitedMazeSquares);
  List_Variables(Machine(Robot))==(movedDirections,yPosition,xPosition,visitedMazeSquares);
  External_List_Variables(Machine(Robot))==(movedDirections,yPosition,xPosition,visitedMazeSquares)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Robot))==(?);
  Abstract_List_VisibleVariables(Machine(Robot))==(?);
  External_List_VisibleVariables(Machine(Robot))==(?);
  Expanded_List_VisibleVariables(Machine(Robot))==(?);
  List_VisibleVariables(Machine(Robot))==(?);
  Internal_List_VisibleVariables(Machine(Robot))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Robot))==(btrue);
  Gluing_List_Invariant(Machine(Robot))==(btrue);
  Expanded_List_Invariant(Machine(Robot))==(btrue);
  Abstract_List_Invariant(Machine(Robot))==(btrue);
  Context_List_Invariant(Machine(Robot))==(btrue);
  List_Invariant(Machine(Robot))==(xPosition: MazeX & yPosition: MazeY & xPosition: NATURAL1 & yPosition: NATURAL1 & xPosition|->yPosition: FreeSquare & visitedMazeSquares: seq(FreeSquare) & movedDirections: seq(MOVEMENT_DIRECTIONS))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Robot))==(btrue);
  Abstract_List_Assertions(Machine(Robot))==(btrue);
  Context_List_Assertions(Machine(Robot))==(btrue);
  List_Assertions(Machine(Robot))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Robot))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Robot))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Robot))==(xPosition,yPosition,visitedMazeSquares,movedDirections:=prj1(MazeX,MazeY)(MazeInitial),prj2(MazeX,MazeY)(MazeInitial),[MazeInitial],<>);
  Context_List_Initialisation(Machine(Robot))==(skip);
  List_Initialisation(Machine(Robot))==(xPosition:=prj1(MazeX,MazeY)(MazeInitial) || yPosition:=prj2(MazeX,MazeY)(MazeInitial) || visitedMazeSquares:=[MazeInitial] || movedDirections:=<>)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Robot))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Robot),Machine(Maze))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Robot))==(btrue);
  List_Constraints(Machine(Robot))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Robot))==(moveNorth,moveSouth,moveEast,moveWest,getRobotRoute,resetMazeRobot,foundExit,getRobotCurrentPosition,directionsTaken,teleport,visitedSquare);
  List_Operations(Machine(Robot))==(moveNorth,moveSouth,moveEast,moveWest,getRobotRoute,resetMazeRobot,foundExit,getRobotCurrentPosition,directionsTaken,teleport,visitedSquare)
END
&
THEORY ListInputX IS
  List_Input(Machine(Robot),moveNorth)==(?);
  List_Input(Machine(Robot),moveSouth)==(?);
  List_Input(Machine(Robot),moveEast)==(?);
  List_Input(Machine(Robot),moveWest)==(?);
  List_Input(Machine(Robot),getRobotRoute)==(?);
  List_Input(Machine(Robot),resetMazeRobot)==(?);
  List_Input(Machine(Robot),foundExit)==(?);
  List_Input(Machine(Robot),getRobotCurrentPosition)==(?);
  List_Input(Machine(Robot),directionsTaken)==(?);
  List_Input(Machine(Robot),teleport)==(newXTeleport,newYTeleport);
  List_Input(Machine(Robot),visitedSquare)==(xPost,yPost)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Robot),moveNorth)==(toast_notification);
  List_Output(Machine(Robot),moveSouth)==(toast_notification);
  List_Output(Machine(Robot),moveEast)==(toast_notification);
  List_Output(Machine(Robot),moveWest)==(toast_notification);
  List_Output(Machine(Robot),getRobotRoute)==(route);
  List_Output(Machine(Robot),resetMazeRobot)==(?);
  List_Output(Machine(Robot),foundExit)==(foundExitSquare);
  List_Output(Machine(Robot),getRobotCurrentPosition)==(currentLocation);
  List_Output(Machine(Robot),directionsTaken)==(allMovements);
  List_Output(Machine(Robot),teleport)==(teleportMessage);
  List_Output(Machine(Robot),visitedSquare)==(isVisited)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Robot),moveNorth)==(toast_notification <-- moveNorth);
  List_Header(Machine(Robot),moveSouth)==(toast_notification <-- moveSouth);
  List_Header(Machine(Robot),moveEast)==(toast_notification <-- moveEast);
  List_Header(Machine(Robot),moveWest)==(toast_notification <-- moveWest);
  List_Header(Machine(Robot),getRobotRoute)==(route <-- getRobotRoute);
  List_Header(Machine(Robot),resetMazeRobot)==(resetMazeRobot);
  List_Header(Machine(Robot),foundExit)==(foundExitSquare <-- foundExit);
  List_Header(Machine(Robot),getRobotCurrentPosition)==(currentLocation <-- getRobotCurrentPosition);
  List_Header(Machine(Robot),directionsTaken)==(allMovements <-- directionsTaken);
  List_Header(Machine(Robot),teleport)==(teleportMessage <-- teleport(newXTeleport,newYTeleport));
  List_Header(Machine(Robot),visitedSquare)==(isVisited <-- visitedSquare(xPost,yPost))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Robot),moveNorth)==(not(xPosition|->yPosition = MazeFinal) & xPosition|->yPosition: MazeArea);
  List_Precondition(Machine(Robot),moveSouth)==(not(xPosition|->yPosition = MazeFinal) & xPosition|->yPosition: MazeArea);
  List_Precondition(Machine(Robot),moveEast)==(not(xPosition|->yPosition = MazeFinal) & xPosition|->yPosition: MazeArea);
  List_Precondition(Machine(Robot),moveWest)==(not(xPosition|->yPosition = MazeFinal) & xPosition|->yPosition: MazeArea);
  List_Precondition(Machine(Robot),getRobotRoute)==(btrue);
  List_Precondition(Machine(Robot),resetMazeRobot)==(xPosition|->yPosition = MazeFinal);
  List_Precondition(Machine(Robot),foundExit)==(foundExitSquare: EXIT_STATUS);
  List_Precondition(Machine(Robot),getRobotCurrentPosition)==(btrue);
  List_Precondition(Machine(Robot),directionsTaken)==(btrue);
  List_Precondition(Machine(Robot),teleport)==(not(xPosition|->yPosition = MazeFinal) & newXTeleport: MazeX & newYTeleport: MazeY);
  List_Precondition(Machine(Robot),visitedSquare)==(xPost: MazeX & yPost: MazeY)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Robot),visitedSquare)==(xPost: MazeX & yPost: MazeY | xPost|->yPost: ran(visitedMazeSquares) ==> isVisited:=YES [] not(xPost|->yPost: ran(visitedMazeSquares)) ==> isVisited:=NO);
  Expanded_List_Substitution(Machine(Robot),teleport)==(not(xPosition|->yPosition = MazeFinal) & newXTeleport: MazeX & newYTeleport: MazeY | newXTeleport|->newYTeleport: FreeSquare ==> (newXTeleport = xPosition & newYTeleport = yPosition ==> teleportMessage:=TELEPORTTOSAMEWALLS_DENIED [] not(newXTeleport = xPosition & newYTeleport = yPosition) ==> (size(visitedMazeSquares) = 1 & newXTeleport|->newYTeleport = MazeFinal ==> teleportMessage:=TELEPORTTOEXITATSTART_DENIED [] not(size(visitedMazeSquares) = 1 & newXTeleport|->newYTeleport = MazeFinal) ==> (not(newXTeleport|->newYTeleport: MazeBlocks) ==> xPosition,yPosition,visitedMazeSquares,teleportMessage,movedDirections:=newXTeleport,newYTeleport,visitedMazeSquares<-(xPosition|->yPosition),TELEPORTATION_SUCESSFULL,movedDirections<-TELEPORT [] not(not(newXTeleport|->newYTeleport: MazeBlocks)) ==> teleportMessage:=TELEPORTTOINTERNALWALLS_DENIED))) [] not(newXTeleport|->newYTeleport: FreeSquare) ==> teleportMessage:=TELEPORTTOINTERNALWALLS_DENIED);
  Expanded_List_Substitution(Machine(Robot),directionsTaken)==(btrue | allMovements:=movedDirections);
  Expanded_List_Substitution(Machine(Robot),getRobotCurrentPosition)==(btrue | currentLocation:=xPosition|->yPosition);
  Expanded_List_Substitution(Machine(Robot),foundExit)==(foundExitSquare: EXIT_STATUS | xPosition|->yPosition = MazeFinal ==> foundExitSquare:=Yes [] not(xPosition|->yPosition = MazeFinal) ==> foundExitSquare:=No);
  Expanded_List_Substitution(Machine(Robot),resetMazeRobot)==(xPosition|->yPosition = MazeFinal | xPosition,yPosition,visitedMazeSquares,movedDirections:=prj1(MazeX,MazeY)(MazeInitial),prj2(MazeX,MazeY)(MazeInitial),[MazeInitial],<>);
  Expanded_List_Substitution(Machine(Robot),getRobotRoute)==(btrue | route:=visitedMazeSquares);
  Expanded_List_Substitution(Machine(Robot),moveWest)==(not(xPosition|->yPosition = MazeFinal) & xPosition|->yPosition: MazeArea | xPosition-1|->yPosition: FreeSquare & xPosition-1|->yPosition: MazeArea ==> xPosition,visitedMazeSquares,toast_notification,movedDirections:=xPosition-1,visitedMazeSquares<-(xPosition|->yPosition),SUCESSFULL_MOVE,movedDirections<-WEST [] not(xPosition-1|->yPosition: FreeSquare & xPosition-1|->yPosition: MazeArea) ==> (xPosition-1|->yPosition: MazeBlocks ==> toast_notification:=INTERNALBLOCKDETECTED_CANNOT_MOVE [] not(xPosition-1|->yPosition: MazeBlocks) ==> toast_notification:=EXTERNALWALLDETECTED_CANNOT_MOVE));
  Expanded_List_Substitution(Machine(Robot),moveEast)==(not(xPosition|->yPosition = MazeFinal) & xPosition|->yPosition: MazeArea | xPosition+1|->yPosition: FreeSquare & xPosition+1|->yPosition: MazeArea ==> xPosition,visitedMazeSquares,toast_notification,movedDirections:=xPosition+1,visitedMazeSquares<-(xPosition|->yPosition),SUCESSFULL_MOVE,movedDirections<-EAST [] not(xPosition+1|->yPosition: FreeSquare & xPosition+1|->yPosition: MazeArea) ==> (xPosition+1|->yPosition: MazeBlocks ==> toast_notification:=INTERNALBLOCKDETECTED_CANNOT_MOVE [] not(xPosition+1|->yPosition: MazeBlocks) ==> toast_notification:=EXTERNALWALLDETECTED_CANNOT_MOVE));
  Expanded_List_Substitution(Machine(Robot),moveSouth)==(not(xPosition|->yPosition = MazeFinal) & xPosition|->yPosition: MazeArea | xPosition|->yPosition-1: FreeSquare & xPosition|->yPosition-1: MazeArea ==> yPosition,visitedMazeSquares,toast_notification,movedDirections:=yPosition-1,visitedMazeSquares<-(xPosition|->yPosition),SUCESSFULL_MOVE,movedDirections<-SOUTH [] not(xPosition|->yPosition-1: FreeSquare & xPosition|->yPosition-1: MazeArea) ==> (xPosition|->yPosition-1: MazeBlocks ==> toast_notification:=INTERNALBLOCKDETECTED_CANNOT_MOVE [] not(xPosition|->yPosition-1: MazeBlocks) ==> toast_notification:=EXTERNALWALLDETECTED_CANNOT_MOVE));
  Expanded_List_Substitution(Machine(Robot),moveNorth)==(not(xPosition|->yPosition = MazeFinal) & xPosition|->yPosition: MazeArea | xPosition|->yPosition+1: FreeSquare & xPosition|->yPosition+1: MazeArea ==> yPosition,visitedMazeSquares,toast_notification,movedDirections:=yPosition+1,visitedMazeSquares<-(xPosition|->yPosition),SUCESSFULL_MOVE,movedDirections<-NORTH [] not(xPosition|->yPosition+1: FreeSquare & xPosition|->yPosition+1: MazeArea) ==> (xPosition|->yPosition+1: MazeBlocks ==> toast_notification:=INTERNALBLOCKDETECTED_CANNOT_MOVE [] not(xPosition|->yPosition+1: MazeBlocks) ==> toast_notification:=EXTERNALWALLDETECTED_CANNOT_MOVE));
  List_Substitution(Machine(Robot),moveNorth)==(IF xPosition|->yPosition+1: FreeSquare & xPosition|->yPosition+1: MazeArea THEN yPosition:=yPosition+1 || visitedMazeSquares:=visitedMazeSquares<-(xPosition|->yPosition) || toast_notification:=SUCESSFULL_MOVE || movedDirections:=movedDirections<-NORTH ELSIF xPosition|->yPosition+1: MazeBlocks THEN toast_notification:=INTERNALBLOCKDETECTED_CANNOT_MOVE ELSE toast_notification:=EXTERNALWALLDETECTED_CANNOT_MOVE END);
  List_Substitution(Machine(Robot),moveSouth)==(IF xPosition|->yPosition-1: FreeSquare & xPosition|->yPosition-1: MazeArea THEN yPosition:=yPosition-1 || visitedMazeSquares:=visitedMazeSquares<-(xPosition|->yPosition) || toast_notification:=SUCESSFULL_MOVE || movedDirections:=movedDirections<-SOUTH ELSIF xPosition|->yPosition-1: MazeBlocks THEN toast_notification:=INTERNALBLOCKDETECTED_CANNOT_MOVE ELSE toast_notification:=EXTERNALWALLDETECTED_CANNOT_MOVE END);
  List_Substitution(Machine(Robot),moveEast)==(IF xPosition+1|->yPosition: FreeSquare & xPosition+1|->yPosition: MazeArea THEN xPosition:=xPosition+1 || visitedMazeSquares:=visitedMazeSquares<-(xPosition|->yPosition) || toast_notification:=SUCESSFULL_MOVE || movedDirections:=movedDirections<-EAST ELSIF xPosition+1|->yPosition: MazeBlocks THEN toast_notification:=INTERNALBLOCKDETECTED_CANNOT_MOVE ELSE toast_notification:=EXTERNALWALLDETECTED_CANNOT_MOVE END);
  List_Substitution(Machine(Robot),moveWest)==(IF xPosition-1|->yPosition: FreeSquare & xPosition-1|->yPosition: MazeArea THEN xPosition:=xPosition-1 || visitedMazeSquares:=visitedMazeSquares<-(xPosition|->yPosition) || toast_notification:=SUCESSFULL_MOVE || movedDirections:=movedDirections<-WEST ELSIF xPosition-1|->yPosition: MazeBlocks THEN toast_notification:=INTERNALBLOCKDETECTED_CANNOT_MOVE ELSE toast_notification:=EXTERNALWALLDETECTED_CANNOT_MOVE END);
  List_Substitution(Machine(Robot),getRobotRoute)==(route:=visitedMazeSquares);
  List_Substitution(Machine(Robot),resetMazeRobot)==(xPosition:=prj1(MazeX,MazeY)(MazeInitial) || yPosition:=prj2(MazeX,MazeY)(MazeInitial) || visitedMazeSquares:=[MazeInitial] || movedDirections:=<>);
  List_Substitution(Machine(Robot),foundExit)==(IF xPosition|->yPosition = MazeFinal THEN foundExitSquare:=Yes ELSE foundExitSquare:=No END);
  List_Substitution(Machine(Robot),getRobotCurrentPosition)==(currentLocation:=xPosition|->yPosition);
  List_Substitution(Machine(Robot),directionsTaken)==(allMovements:=movedDirections);
  List_Substitution(Machine(Robot),teleport)==(IF newXTeleport|->newYTeleport: FreeSquare THEN IF newXTeleport = xPosition & newYTeleport = yPosition THEN teleportMessage:=TELEPORTTOSAMEWALLS_DENIED ELSE IF size(visitedMazeSquares) = 1 & newXTeleport|->newYTeleport = MazeFinal THEN teleportMessage:=TELEPORTTOEXITATSTART_DENIED ELSE IF not(newXTeleport|->newYTeleport: MazeBlocks) THEN xPosition:=newXTeleport || yPosition:=newYTeleport || visitedMazeSquares:=visitedMazeSquares<-(xPosition|->yPosition) || teleportMessage:=TELEPORTATION_SUCESSFULL || movedDirections:=movedDirections<-TELEPORT ELSE teleportMessage:=TELEPORTTOINTERNALWALLS_DENIED END END END ELSE teleportMessage:=TELEPORTTOINTERNALWALLS_DENIED END);
  List_Substitution(Machine(Robot),visitedSquare)==(IF xPost|->yPost: ran(visitedMazeSquares) THEN isVisited:=YES ELSE isVisited:=NO END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Robot))==(?);
  Inherited_List_Constants(Machine(Robot))==(?);
  List_Constants(Machine(Robot))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Robot),TOAST_NOTIFICATION)==({SUCESSFULL_MOVE,INTERNALBLOCKDETECTED_CANNOT_MOVE,EXTERNALWALLDETECTED_CANNOT_MOVE,TELEPORTATION_SUCESSFULL,TELEPORTTOSAMEWALLS_DENIED,TELEPORTTOINTERNALWALLS_DENIED,TELEPORTTOEXITATSTART_DENIED,UNSUCCESSFUL_MOVE});
  Context_List_Enumerated(Machine(Robot))==(?);
  Context_List_Defered(Machine(Robot))==(?);
  Context_List_Sets(Machine(Robot))==(?);
  List_Valuable_Sets(Machine(Robot))==(?);
  Inherited_List_Enumerated(Machine(Robot))==(?);
  Inherited_List_Defered(Machine(Robot))==(?);
  Inherited_List_Sets(Machine(Robot))==(?);
  List_Enumerated(Machine(Robot))==(TOAST_NOTIFICATION,IS_VISITED,EXIT_STATUS,MOVEMENT_DIRECTIONS);
  List_Defered(Machine(Robot))==(?);
  List_Sets(Machine(Robot))==(TOAST_NOTIFICATION,IS_VISITED,EXIT_STATUS,MOVEMENT_DIRECTIONS);
  Set_Definition(Machine(Robot),IS_VISITED)==({YES,NO});
  Set_Definition(Machine(Robot),EXIT_STATUS)==({Yes,No});
  Set_Definition(Machine(Robot),MOVEMENT_DIRECTIONS)==({NORTH,SOUTH,EAST,WEST,TELEPORT})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Robot))==(?);
  Expanded_List_HiddenConstants(Machine(Robot))==(?);
  List_HiddenConstants(Machine(Robot))==(?);
  External_List_HiddenConstants(Machine(Robot))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Robot))==(btrue);
  Context_List_Properties(Machine(Robot))==(MazeX = 1..7 & MazeY = 1..5 & MazeArea = MazeX*MazeY & MazeBlocks <: MazeArea & MazeBlocks = {1|->3,2|->1,2|->3,2|->5,3|->3,4|->2,4|->3,4|->4,6|->1,6|->2,6|->4,7|->4} & FreeSquare <: MazeArea & FreeSquare/\MazeBlocks = {} & FreeSquare\/MazeBlocks = MazeArea & MazeInitial: FreeSquare & MazeInitial: MazeArea & MazeInitial = 1|->1 & MazeFinal: FreeSquare & MazeFinal: MazeArea & MazeFinal = 1|->5);
  Inherited_List_Properties(Machine(Robot))==(btrue);
  List_Properties(Machine(Robot))==(TOAST_NOTIFICATION: FIN(INTEGER) & not(TOAST_NOTIFICATION = {}) & IS_VISITED: FIN(INTEGER) & not(IS_VISITED = {}) & EXIT_STATUS: FIN(INTEGER) & not(EXIT_STATUS = {}) & MOVEMENT_DIRECTIONS: FIN(INTEGER) & not(MOVEMENT_DIRECTIONS = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Robot),Machine(Maze))==(?);
  Seen_Context_List_Enumerated(Machine(Robot))==(?);
  Seen_Context_List_Invariant(Machine(Robot))==(btrue);
  Seen_Context_List_Assertions(Machine(Robot))==(btrue);
  Seen_Context_List_Properties(Machine(Robot))==(btrue);
  Seen_List_Constraints(Machine(Robot))==(btrue);
  Seen_List_Operations(Machine(Robot),Machine(Maze))==(?);
  Seen_Expanded_List_Invariant(Machine(Robot),Machine(Maze))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Robot),moveNorth)==(?);
  List_ANY_Var(Machine(Robot),moveSouth)==(?);
  List_ANY_Var(Machine(Robot),moveEast)==(?);
  List_ANY_Var(Machine(Robot),moveWest)==(?);
  List_ANY_Var(Machine(Robot),getRobotRoute)==(?);
  List_ANY_Var(Machine(Robot),resetMazeRobot)==(?);
  List_ANY_Var(Machine(Robot),foundExit)==(?);
  List_ANY_Var(Machine(Robot),getRobotCurrentPosition)==(?);
  List_ANY_Var(Machine(Robot),directionsTaken)==(?);
  List_ANY_Var(Machine(Robot),teleport)==(?);
  List_ANY_Var(Machine(Robot),visitedSquare)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Robot)) == (TOAST_NOTIFICATION,IS_VISITED,EXIT_STATUS,MOVEMENT_DIRECTIONS,SUCESSFULL_MOVE,INTERNALBLOCKDETECTED_CANNOT_MOVE,EXTERNALWALLDETECTED_CANNOT_MOVE,TELEPORTATION_SUCESSFULL,TELEPORTTOSAMEWALLS_DENIED,TELEPORTTOINTERNALWALLS_DENIED,TELEPORTTOEXITATSTART_DENIED,UNSUCCESSFUL_MOVE,YES,NO,Yes,No,NORTH,SOUTH,EAST,WEST,TELEPORT | ? | movedDirections,yPosition,xPosition,visitedMazeSquares | ? | moveNorth,moveSouth,moveEast,moveWest,getRobotRoute,resetMazeRobot,foundExit,getRobotCurrentPosition,directionsTaken,teleport,visitedSquare | ? | seen(Machine(Maze)) | ? | Robot);
  List_Of_HiddenCst_Ids(Machine(Robot)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Robot)) == (?);
  List_Of_VisibleVar_Ids(Machine(Robot)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Robot)) == (?: ?);
  List_Of_Ids(Machine(Maze)) == (MazeX,MazeY,MazeArea,MazeBlocks,FreeSquare,MazeInitial,MazeFinal | ? | ? | ? | ? | ? | ? | ? | Maze);
  List_Of_HiddenCst_Ids(Machine(Maze)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Maze)) == (MazeX,MazeY,MazeArea,MazeBlocks,FreeSquare,MazeInitial,MazeFinal);
  List_Of_VisibleVar_Ids(Machine(Maze)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Maze)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Robot)) == (Type(TOAST_NOTIFICATION) == Cst(SetOf(etype(TOAST_NOTIFICATION,0,7)));Type(IS_VISITED) == Cst(SetOf(etype(IS_VISITED,0,1)));Type(EXIT_STATUS) == Cst(SetOf(etype(EXIT_STATUS,0,1)));Type(MOVEMENT_DIRECTIONS) == Cst(SetOf(etype(MOVEMENT_DIRECTIONS,0,4))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Robot)) == (Type(SUCESSFULL_MOVE) == Cst(etype(TOAST_NOTIFICATION,0,7));Type(INTERNALBLOCKDETECTED_CANNOT_MOVE) == Cst(etype(TOAST_NOTIFICATION,0,7));Type(EXTERNALWALLDETECTED_CANNOT_MOVE) == Cst(etype(TOAST_NOTIFICATION,0,7));Type(TELEPORTATION_SUCESSFULL) == Cst(etype(TOAST_NOTIFICATION,0,7));Type(TELEPORTTOSAMEWALLS_DENIED) == Cst(etype(TOAST_NOTIFICATION,0,7));Type(TELEPORTTOINTERNALWALLS_DENIED) == Cst(etype(TOAST_NOTIFICATION,0,7));Type(TELEPORTTOEXITATSTART_DENIED) == Cst(etype(TOAST_NOTIFICATION,0,7));Type(UNSUCCESSFUL_MOVE) == Cst(etype(TOAST_NOTIFICATION,0,7));Type(YES) == Cst(etype(IS_VISITED,0,1));Type(NO) == Cst(etype(IS_VISITED,0,1));Type(Yes) == Cst(etype(EXIT_STATUS,0,1));Type(No) == Cst(etype(EXIT_STATUS,0,1));Type(NORTH) == Cst(etype(MOVEMENT_DIRECTIONS,0,4));Type(SOUTH) == Cst(etype(MOVEMENT_DIRECTIONS,0,4));Type(EAST) == Cst(etype(MOVEMENT_DIRECTIONS,0,4));Type(WEST) == Cst(etype(MOVEMENT_DIRECTIONS,0,4));Type(TELEPORT) == Cst(etype(MOVEMENT_DIRECTIONS,0,4)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Robot)) == (Type(movedDirections) == Mvl(SetOf(btype(INTEGER,?,?)*etype(MOVEMENT_DIRECTIONS,?,?)));Type(yPosition) == Mvl(btype(INTEGER,?,?));Type(xPosition) == Mvl(btype(INTEGER,?,?));Type(visitedMazeSquares) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?)))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Robot)) == (Type(visitedSquare) == Cst(etype(IS_VISITED,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(teleport) == Cst(etype(TOAST_NOTIFICATION,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(directionsTaken) == Cst(SetOf(btype(INTEGER,?,?)*etype(MOVEMENT_DIRECTIONS,?,?)),No_type);Type(getRobotCurrentPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(foundExit) == Cst(etype(EXIT_STATUS,?,?),No_type);Type(resetMazeRobot) == Cst(No_type,No_type);Type(getRobotRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(moveWest) == Cst(etype(TOAST_NOTIFICATION,?,?),No_type);Type(moveEast) == Cst(etype(TOAST_NOTIFICATION,?,?),No_type);Type(moveSouth) == Cst(etype(TOAST_NOTIFICATION,?,?),No_type);Type(moveNorth) == Cst(etype(TOAST_NOTIFICATION,?,?),No_type));
  Observers(Machine(Robot)) == (Type(visitedSquare) == Cst(etype(IS_VISITED,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(directionsTaken) == Cst(SetOf(btype(INTEGER,?,?)*etype(MOVEMENT_DIRECTIONS,?,?)),No_type);Type(getRobotCurrentPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(foundExit) == Cst(etype(EXIT_STATUS,?,?),No_type);Type(getRobotRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
