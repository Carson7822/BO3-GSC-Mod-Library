//Function calls all triggers with the target name
function autoexec main()
{
	trigs = GetEntArray("secret_door_trig", "targetname");
	foreach(trig in trigs) {
		trig thread MonitorTrigger();
	}

	//Loop that keeps track of how many triggers have been activated 
	triggersActivated = 0;
	//trigs size is the amount of triggers on the map with the target name
	while(triggersActivated < trigs.size) {
		Level waittill("power_door_trig");
		triggersActivated ++;
	}

	//Identifies what door we want to move open along with that doors clip
	doorModel = GetEnt("power_door", "targetname");
	doorModelOne = GetEnt("power_door_two", "targetname");
	doorClip = getEnt("power_door_clip", "targetname");

	//Moves door and deletes the clip 
	doorModel MoveZ(-128,1);
	doorModelOne MoveZ(-128,1);
	doorClip Delete();
	IPrintLnBold("Power Supplied...");

}
//Function for interacting with trigger before it is activated
function MonitorTrigger()
{
	self UseTriggerRequireLookAt();
	self SetHintString("Press ^3[{+activate}]^7 To Supply Power");
	self waittill("trigger");
	self PlaySound("power_sound");
	//Deletes itself after activated 
	self Delete();
	//notifys the code that a trigger has been activated 
	Level notify("power_door_trig");
}