/// @description Frees all surfaces from texture memory. This is useful for resizing surfaces whenever the game's
/// aspect ratio is changed.


if (surface_exists(resultSurface)) {surface_free(resultSurface);}
if (surface_exists(lightSurface)) {surface_free(lightSurface);}
if (surface_exists(blurSurfaceBuffer)) {surface_free(blurSurfaceBuffer);}