// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bulletWallDetector(targetID, xDiff, yDiff){
	var finalX = targetID.x;
	var finalY = targetID.y;
	var currentX = x;
	var currentY = y;
	var vect = VectorTo(targetID.x, targetID.y);
	while(sign(finalX - currentX) == xDiff and sign(finalY - currentY) == yDiff){
		if(place_meeting(currentX,currentY, oWall)){
			return 1;
		}
		currentX += vect[0];
		currentY += vect[1];
	}
	return 0;
}