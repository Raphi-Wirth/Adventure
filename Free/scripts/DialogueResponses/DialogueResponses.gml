// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//@arg Response
function DialogueResponses(){
	switch (argument0) {
		case 0: break;
		
		case "fightNPC": NewTextBox("That's the last straw.\nTime to die mate",0, ["Yes:Yes", "No:No"]); break;
	
		case "avoidFightNPC": NewTextBox("That's what I thought.\nPathetic.", 0); break;
	
		case "Yes": NewTextBox("Wow.\nSad.",0); break;
		
		case "No": break;
		
		case "ForestExplanation": NewTextBox("Pollen count is really high this time of year.",0); break;
	
	}
	
}