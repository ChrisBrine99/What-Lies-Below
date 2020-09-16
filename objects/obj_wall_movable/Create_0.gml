/// @description Variable Initialization

#region EDITING INHERITED VARIABLES

wallType = Wall.Movable;

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// The wall's current horizontal and vertical movement velocity, respectively.
hspd = 0;
vspd = 0;

// Stores any fraction values within the current hspd and vspd values. Prevent sub-pixel movement which
// would make collision checking/resolving a pain in the ass.
hspdFraction = 0;
vspdFraction = 0;

// Determines how slow the entity pushing the wall will move when pushing against the wall.
weight = 1;

#endregion