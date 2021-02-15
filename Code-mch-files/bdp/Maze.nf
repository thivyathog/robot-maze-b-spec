﻿Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Maze))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Maze))==(Machine(Maze));
  Level(Machine(Maze))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Maze)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Maze))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Maze))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Maze))==(?);
  List_Includes(Machine(Maze))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Maze))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Maze))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Maze))==(?);
  Context_List_Variables(Machine(Maze))==(?);
  Abstract_List_Variables(Machine(Maze))==(?);
  Local_List_Variables(Machine(Maze))==(?);
  List_Variables(Machine(Maze))==(?);
  External_List_Variables(Machine(Maze))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Maze))==(?);
  Abstract_List_VisibleVariables(Machine(Maze))==(?);
  External_List_VisibleVariables(Machine(Maze))==(?);
  Expanded_List_VisibleVariables(Machine(Maze))==(?);
  List_VisibleVariables(Machine(Maze))==(?);
  Internal_List_VisibleVariables(Machine(Maze))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Maze))==(btrue);
  Gluing_List_Invariant(Machine(Maze))==(btrue);
  Expanded_List_Invariant(Machine(Maze))==(btrue);
  Abstract_List_Invariant(Machine(Maze))==(btrue);
  Context_List_Invariant(Machine(Maze))==(btrue);
  List_Invariant(Machine(Maze))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Maze))==(btrue);
  Abstract_List_Assertions(Machine(Maze))==(btrue);
  Context_List_Assertions(Machine(Maze))==(btrue);
  List_Assertions(Machine(Maze))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Maze))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Maze))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Maze))==(skip);
  Context_List_Initialisation(Machine(Maze))==(skip);
  List_Initialisation(Machine(Maze))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Maze))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Maze))==(btrue);
  List_Constraints(Machine(Maze))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Maze))==(?);
  List_Operations(Machine(Maze))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Maze))==(MazeX,MazeY,MazeArea,MazeBlocks,FreeSquare,MazeInitial,MazeFinal);
  Inherited_List_Constants(Machine(Maze))==(?);
  List_Constants(Machine(Maze))==(MazeX,MazeY,MazeArea,MazeBlocks,FreeSquare,MazeInitial,MazeFinal)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Maze))==(?);
  Context_List_Defered(Machine(Maze))==(?);
  Context_List_Sets(Machine(Maze))==(?);
  List_Valuable_Sets(Machine(Maze))==(?);
  Inherited_List_Enumerated(Machine(Maze))==(?);
  Inherited_List_Defered(Machine(Maze))==(?);
  Inherited_List_Sets(Machine(Maze))==(?);
  List_Enumerated(Machine(Maze))==(?);
  List_Defered(Machine(Maze))==(?);
  List_Sets(Machine(Maze))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Maze))==(?);
  Expanded_List_HiddenConstants(Machine(Maze))==(?);
  List_HiddenConstants(Machine(Maze))==(?);
  External_List_HiddenConstants(Machine(Maze))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Maze))==(btrue);
  Context_List_Properties(Machine(Maze))==(btrue);
  Inherited_List_Properties(Machine(Maze))==(btrue);
  List_Properties(Machine(Maze))==(MazeX = 1..7 & MazeY = 1..5 & MazeArea = MazeX*MazeY & MazeBlocks <: MazeArea & MazeBlocks = {1|->3,2|->1,2|->3,2|->5,3|->3,4|->2,4|->3,4|->4,6|->1,6|->2,6|->4,7|->4} & FreeSquare <: MazeArea & FreeSquare/\MazeBlocks = {} & FreeSquare\/MazeBlocks = MazeArea & MazeInitial: FreeSquare & MazeInitial: MazeArea & MazeInitial = 1|->1 & MazeFinal: FreeSquare & MazeFinal: MazeArea & MazeFinal = 1|->5)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Maze)) == (MazeX,MazeY,MazeArea,MazeBlocks,FreeSquare,MazeInitial,MazeFinal | ? | ? | ? | ? | ? | ? | ? | Maze);
  List_Of_HiddenCst_Ids(Machine(Maze)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Maze)) == (MazeX,MazeY,MazeArea,MazeBlocks,FreeSquare,MazeInitial,MazeFinal);
  List_Of_VisibleVar_Ids(Machine(Maze)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Maze)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Maze)) == (Type(MazeX) == Cst(SetOf(btype(INTEGER,"[MazeX","]MazeX")));Type(MazeY) == Cst(SetOf(btype(INTEGER,"[MazeY","]MazeY")));Type(MazeArea) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(MazeBlocks) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(FreeSquare) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(MazeInitial) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(MazeFinal) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
