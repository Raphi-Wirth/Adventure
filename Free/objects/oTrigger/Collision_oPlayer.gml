/// @description Insert description here
// You can write your code in this editor
if(collisionEvent != -1 and deactivatedTimer >= deactivatedLength){
	deactivatedTimer = 0;
	ScriptExecuteArray(collisionEvent, collisionArgs);
}