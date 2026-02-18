#using scripts\codescripts\struct;

#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\compass;
#using scripts\shared\exploder_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\laststand_shared;
#using scripts\shared\math_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\util_shared;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#insert scripts\zm\_zm_utility.gsh;

#using scripts\zm\_load;
#using scripts\zm\_zm;
#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_powerups;
#using scripts\zm\_zm_utility;
#using scripts\zm\_zm_weapons;
#using scripts\zm\_zm_zonemgr;

#using scripts\shared\ai\zombie_utility;


function autoexec elevator_repair()
{
	gear_place = GetEnt("gear_place", "targetname");
	gear_place Hide();
	gear_p1 = GetEnt("gear_p1", "targetname");
	gear_p2 = GetEnt("gear_p2", "targetname");
	gear_p3 = GetEnt("gear_p3", "targetname");
	elevator_door_clip = GetEnt("elevator_door_clip", "targetname");
	gear_p1 Hide();
	gear_p2 Hide();
	gear_p3 Hide();
	elevator_door_clip Hide();
	level.gear_count = 0;
	thread elevator_message_f();
	radio = GetEnt("radio", "targetname");
	radio_trig = GetEnt("radio_trig", "targetname");
	radio_trig SetHintString("Hold ^3[{+activate}]^7 to Pick up Radio");
	radio_trig waittill("trigger", player);
	radio Delete();
	radio_trig Delete();
	//Wait time for dialoge of Nathan
	wait 0;
	thread gear1_f();
	thread gear2_f();
	thread gear3_f();
}

function gear1_f()
{
	gear1 = GetEnt("gear1","targetname");
	gear1_trig = GetEnt("gear1_trig", "targetname");
	gear1_trig SetHintString("Hold ^3[{+activate}]^7 to Pick up Gear");
	gear1_trig waittill("trigger", player);
	gear1 PlaySound("gear_pickup");
	gear1 Delete();
	gear1_trig Delete();
	level.gear_count++;
	thread gear_place_f();
}
function gear2_f()
{
	gear2 = GetEnt("gear2","targetname");
	gear2_trig = GetEnt("gear2_trig", "targetname");
	gear2_trig SetHintString("Hold ^3[{+activate}]^7 to Pick up Gear");
	gear2_trig waittill("trigger", player);
	gear2 PlaySound("gear_pickup");
	gear2 Delete();
	gear2_trig Delete();
	level.gear_count++;
	thread gear_place_f();
}
function gear3_f()
{
	gear3 = GetEnt("gear3","targetname");
	gear3_trig = GetEnt("gear3_trig", "targetname");
	gear3_trig SetHintString("Hold ^3[{+activate}]^7 to Pick up Gear");
	gear3_trig waittill("trigger", player);
	gear3 PlaySound("gear_pickup");
	gear3 Delete();
	gear3_trig Delete();
	level.gear_count++;
	thread gear_place_f();
}
function elevator_message_f()
{
	elevator_message = GetEnt("elevator_message", "targetname");
	elevator_message SetHintString("The Elevator Must be Repaired...");
	elevator_message waittill("trigger", player);
}

function gear_place_f()
{
	if (level.gear_count == 3)
	{
		elevator_message = GetEnt("elevator_message", "targetname");
		elevator_message Delete();
		gear_p1 = GetEnt("gear_p1", "targetname");
		gear_p2 = GetEnt("gear_p2", "targetname");
		gear_p3 = GetEnt("gear_p3", "targetname");

		gear_place = GetEnt("gear_place", "targetname");
		gear_place Show();
		gear_place SetHintString("Hold ^3[{+activate}]^7 to Place Gear");
		gear_place waittill("trigger", player);
		gear_p1 Show();
		gear_place waittill("trigger", player);
		gear_p2 Show();
		gear_place waittill("trigger", player);
		gear_p3 Show();
		gear_place Delete();
		elevator_start = GetEnt("elevator_start", "targetname");
		elevator_start SetHintString("Hold ^3[{+activate}]^7 to Start Elevator");
		elevator_start waittill("trigger", player);
		elevator_start Delete();
		elevator_door_clip = GetEnt("elevator_door_clip", "targetname");
		elevator_door_clip Show();
		level thread RotatingEntities1();
		level thread RotatingEntities2();
		level thread RotatingEntities3();
		wait 1;
		level thread elevator_door_close_right();
		level thread elevator_door_close_left();
		wait 6;
		thread elevator_go();
	}


}


function RotatingEntities1()
{
	/*==================== ROTATING ENTITIES BY PROGRAM115 ====================
		Using either a script_model or script_brushmodel, give it the KvP of targetname: rotate_ent

		Add any of the following kvps:
		script_noteworthy: Rotation axis (x, y or z). Default = 'x'
		script_transition_time: Time taken for 1 rotation
		script_string: Is power required for it to rotate? (yes = 'power', no = leave blank)
		script_sound: Sound to play from the entity while it's rotating. MUST BE A LOOPING AND 3D SOUND
	*/
	gear_p1 = GetEntArray("gear_p1", "targetname");
	if(isdefined(gear_p1))
	{
		for(i = 0; i < gear_p1.size; i++)
		{
			gear_p1[i] thread rotate_ent1();
		}
	}
}
function rotate_ent1()
{
	//Handles speed
	if(isdefined(self.script_transition_time))
	{
		speed = self.script_transition_time;
	}
	else
	{
		speed = 5;
	}

	//Handle power requirement
	if(isdefined(self.script_string))
	{
		//The user wants power to be required
		level waittill("power_on");
	}

	//Handle sound playing while rotating
	if(isdefined(self.script_sound))
	{
		self PlayLoopSound(self.script_sound);
	}

	//Rotate the entities
	while(1)
	{
		if(isdefined(self.script_noteworthy))
		{
			if(self.script_noteworthy == "x")
			{
				self rotateRoll(360, speed);
			}
			else if(self.script_noteworthy == "y")
			{
				self rotatePitch(360, speed);
			}
			else if(self.script_noteworthy == "z")
			{
				self rotateYaw(360, speed);
			}
		}
		else
		{
			self rotateRoll(360, speed);
		}
		wait(speed);
	}
}






function RotatingEntities2()
{
	gear_p2 = GetEntArray("gear_p2", "targetname");
	if(isdefined(gear_p2))
	{
		for(i = 0; i < gear_p2.size; i++)
		{
			gear_p2[i] thread rotate_ent2();
		}
	}
}
function rotate_ent2()
{
	//Handles speed
	if(isdefined(self.script_transition_time))
	{
		speed = self.script_transition_time;
	}
	else
	{
		speed = 5;
	}

	//Handle power requirement
	if(isdefined(self.script_string))
	{
		//The user wants power to be required
		level waittill("power_on");
	}

	//Handle sound playing while rotating
	if(isdefined(self.script_sound))
	{
		self PlayLoopSound(self.script_sound);
	}

	//Rotate the entities
	while(1)
	{
		if(isdefined(self.script_noteworthy))
		{
			if(self.script_noteworthy == "x")
			{
				self rotateRoll(-360, speed);
			}
			else if(self.script_noteworthy == "y")
			{
				self rotatePitch(360, speed);
			}
			else if(self.script_noteworthy == "z")
			{
				self rotateYaw(360, speed);
			}
		}
		else
		{
			self rotateRoll(360, speed);
		}
		wait(speed);
	}
}


function generate_code() {
	print_code = array(0);
	thread test();

	random_number = RandomIntRange(0,9);
	random_number1 = RandomIntRange(0,9);
	random_number2 = RandomIntRange(0,9);
	random_number3 = RandomIntRange(0,9);
	code = array(random_number,random_number1,random_number2,random_number3);
		foreach ( print_code in code) {
			IPrintLnBold(print_code);
			wait 1;
		}
	}


function RotatingEntities3()
{
	gear_p3 = GetEntArray("gear_p3", "targetname");
	if(isdefined(gear_p3))
	{
		for(i = 0; i < gear_p3.size; i++)
		{
			gear_p3[i] thread rotate_ent3();
		}
	}
}
function rotate_ent3()
{
	//Handles speed
	if(isdefined(self.script_transition_time))
	{
		speed = self.script_transition_time;
	}
	else
	{
		speed = 5;
	}

	//Handle power requirement
	if(isdefined(self.script_string))
	{
		//The user wants power to be required
		level waittill("power_on");
	}

	//Handle sound playing while rotating
	if(isdefined(self.script_sound))
	{
		self PlayLoopSound(self.script_sound);
	}

	//Rotate the entities
	while(1)
	{
		if(isdefined(self.script_noteworthy))
		{
			if(self.script_noteworthy == "x")
			{
				self rotateRoll(360, speed);
			}
			else if(self.script_noteworthy == "y")
			{
				self rotatePitch(360, speed);
			}
			else if(self.script_noteworthy == "z")
			{
				self rotateYaw(360, speed);
			}
		}
		else
		{
			self rotateRoll(360, speed);
		}
		wait(speed);
	}
}

function elevator_door_close_right(){

	elevator_door1_right = GetEnt("elevator_door1_right", "targetname");
	elevator_door1_right PlaySound("elevator_door_close");
	elevator_door1_right MoveY(22,4);


}


function elevator_door_close_left(){

	elevator_door1_left = GetEnt("elevator_door1_left", "targetname");
	elevator_door1_left MoveY(-22,4);

}


function elevator_go(){
	thread eef_meet();
	gear_p1 = GetEnt("gear_p1", "targetname");
	gear_p2 = GetEnt("gear_p2", "targetname");
	gear_p3 = GetEnt("gear_p3", "targetname");
	elevator_block = GetEnt("elevator_block", "targetname");
	elevator_door1_right = GetEnt("elevator_door1_right", "targetname");
	elevator_door1_left = GetEnt("elevator_door1_left", "targetname");
	elevator_door1_right PlaySound("elevator_going_down");
	elevator_floor = GetEnt("elevator_floor", "targetname");
	elevator_panel = GetEnt("elevator_panel", "targetname");
	elevator = GetEnt("elevator", "targetname");
	elevator MoveZ(-900, 42);
	elevator_floor MoveZ(-900, 42);
	elevator_panel MoveZ(-900, 42);
	gear_p1 MoveZ(-900, 42);
	gear_p2 MoveZ(-900, 42);
	gear_p3 MoveZ(-900, 42);
	elevator_block MoveZ(-500, 42);
	elevator_door1_right MoveZ(-900, 42);
	elevator_door1_left MoveZ(-900, 42);
	wait 44;
	elevator_door1_left MoveY(22,4);
	elevator_door1_right MoveY(-22,4);
}			

function eef_meet() {
	thread generate_code();
	level flag::clear("spawn_zombies");
	eef_talk = GetEnt("eef_talk", "targetname");
	eef_talk SetHintString("Hold ^3[{+activate}]^7 to talk to Ethan");
	eef_talk waittill("trigger", player);
	eef_talk Delete();
	level flag::set("spawn_zombies"); 
}

function test () {
	audio_t = GetEnt("audio_t", "targetname");
	audio_t SetHintString("sdfdsfsdfdsf");
	audio_t waittill("trigger", player);
	audio_t playSound("steve");
}
