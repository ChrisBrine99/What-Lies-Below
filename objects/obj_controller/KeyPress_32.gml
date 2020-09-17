/// @description Switching Aspect Ratio On the Fly

curAspectRatio++;
if (curAspectRatio >= array_length_1d(aspectRatio)){
	curAspectRatio = 0;	
}
set_camera_aspect_ratio(aspectRatio[curAspectRatio], 4);