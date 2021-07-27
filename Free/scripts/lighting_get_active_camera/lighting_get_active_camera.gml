/// @desc Gets the active camera
/// @returns The active camera port [X, Y, Width, Height]
function lighting_get_active_camera() {

	if(global.worldCustomCamera == undefined) {
	// Get active view camera
	 var camera = oCamera // camera_get_active();
	 var cameraX = oCamera.x-1366 //camera_get_view_x(camera);
	 var cameraY = oCamera.y-768 //camera_get_view_y(camera);
	 var cameraW = 1366*2 //camera_get_view_width(camera);
	 var cameraH = 768*2 // camera_get_view_height(camera);
	 return [cameraX, cameraY, cameraW, cameraH];
	}
	return global.worldCustomCamera;


}
