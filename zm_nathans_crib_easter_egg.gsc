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

#using scripts\zm\growing_soulbox;



//lockdown Charge FX
#precache( "fx", "dlc1/castle/fx_lightning_strike_weathervane" );
#precache( "fx", "dlc1/castle/fx_battery_lightning_castle" );
#precache( "fx", "dlc1/castle/fx_ee_keeper_demonhead_despawn" );

function autoexec step_one()
{
	//Sets up all things that need to be hidden
	power_tele_out = GetEnt("power_tele_out", "targetname");
	power_tele_out Hide();
	lockdown_clip = GetEnt("lockdown_clip", "targetname");
	lockdown_clip Hide();
	lockdown_barrier = GetEnt("lockdown_barrier", "targetname");
	lockdown_barrier Hide();
	panel_place = GetEnt("panel_place", "targetname");
	panel_place Hide();
	nathan_panel = GetEnt("nathan_panel", "targetname");
	nathan_panel Hide();
	cleaning_clip = GetEnt("cleaning_clip", "targetname");
	cashier_vape = GetEnt("cashier_vape", "targetname");
	cashier_vape Hide();
	pay_clip = GetEnt("pay_clip", "targetname");
	pay_clip Hide();
	lockdown_clip1 = GetEnt("lockdown_clip1", "targetname");
	lockdown_clip1 Hide();
	lockdown_barrier1 = GetEnt("lockdown_barrier1", "targetname");
	lockdown_barrier1 Hide();
	donut_lockdown_d1 = GetEnt("donut_lockdown_d1", "targetname");
	donut_lockdown_d2 = GetEnt("donut_lockdown_d2", "targetname");
	donut_lockdown_clip1 = GetEnt("donut_lockdown_clip1", "targetname");
	donut_lockdown_clip2 = GetEnt("donut_lockdown_clip2", "targetname");
	donut_lockdown_d1 Hide();
	donut_lockdown_clip1 Hide();
	donut_lockdown_d2 Hide();
	donut_lockdown_clip2 Hide();
	donut_lockdown_d3 = GetEnt("donut_lockdown_d3", "targetname");
	donut_lockdown_clip3 = GetEnt("donut_lockdown_clip3", "targetname");
	donut_lockdown_d3 Hide();
	donut_lockdown_clip3 Hide();
	donut_trig1 = GetEnt("donut_trig1", "targetname");
	donut_trig1 Hide();
	donut_target1 = GetEnt("donut_target1", "targetname");
	donut_target1 Hide();
	key1 = GetEnt("key1","targetname");
	key1_trig = GetEnt("key1_trig", "targetname");
	key1 Hide();
	key1_trig Hide();
	key2 = GetEnt("key2", "targetname");
	key2 Hide();
	key_trig2 = GetEnt("key_trig2", "targetname");
	key_trig2 Hide();
	key3 = GetEnt("key3", "targetname");
	key3 Hide();
	key_trig3 = GetEnt("key_trig3", "targetname");
	key_trig3 Hide();
	donut_trig2 = GetEnt("donut_trig2", "targetname");
	donut_trig2 Hide();
	donut_target2 = GetEnt("donut_target2", "targetname");
	donut_target2 Hide();
	donut_trig3 = GetEnt("donut_trig3", "targetname");
	donut_trig3 Hide();
	donut_target3 = GetEnt("donut_target3", "targetname");
	donut_target3 Hide();
	donut_trig4 = GetEnt("donut_trig4", "targetname");
	donut_trig4 Hide();
	donut_target4 = GetEnt("donut_target4", "targetname");
	donut_target4 Hide();
	donut_trig5 = GetEnt("donut_trig5", "targetname");
	donut_trig5 Hide();
	donut_target5 = GetEnt("donut_target5", "targetname");
	donut_target5 Hide();
	donut_trig6 = GetEnt("donut_trig6", "targetname");
	donut_trig6 Hide();
	donut_target6 = GetEnt("donut_target6", "targetname");
	donut_target6 Hide();
	donut_trig7 = GetEnt("donut_trig7", "targetname");
	donut_trig7 Hide();
	donut_target7 = GetEnt("donut_target7", "targetname");
	donut_target7 Hide();
	donut_trig8 = GetEnt("donut_trig8", "targetname");
	donut_trig8 Hide();
	donut_target8 = GetEnt("donut_target8", "targetname");
	donut_target8 Hide();
	donut_trig9 = GetEnt("donut_trig9", "targetname");
	donut_trig9 Hide();
	donut_target9 = GetEnt("donut_target9", "targetname");
	donut_target9 Hide();
	donut_trig10 = GetEnt("donut_trig10", "targetname");
	donut_trig10 Hide();
	donut_target10 = GetEnt("donut_target10", "targetname");
	donut_target10 Hide();
	donut_trig11 = GetEnt("donut_trig11", "targetname");
	donut_trig11 Hide();
	donut_target11 = GetEnt("donut_target11", "targetname");
	donut_target11 Hide();
	donut_trig12 = GetEnt("donut_trig12", "targetname");
	donut_trig12 Hide();
	donut_target12 = GetEnt("donut_target12", "targetname");
	donut_target12 Hide();
	donut_trig13 = GetEnt("donut_trig13", "targetname");
	donut_trig13 Hide();
	donut_target13 = GetEnt("donut_target13", "targetname");
	donut_target13 Hide();
	donut_trig14 = GetEnt("donut_trig14", "targetname");
	donut_trig14 Hide();
	donut_target14 = GetEnt("donut_target14", "targetname");
	donut_target14 Hide();
	donut_trig15 = GetEnt("donut_trig15", "targetname");
	donut_trig15 Hide();
	donut_target15 = GetEnt("donut_target15", "targetname");
	donut_target15 Hide();
	donut_trig16 = GetEnt("donut_trig16", "targetname");
	donut_trig16 Hide();
	donut_target16 = GetEnt("donut_target16", "targetname");
	donut_target16 Hide();
	donut_trig17 = GetEnt("donut_trig17", "targetname");
	donut_trig17 Hide();
	donut_target17 = GetEnt("donut_target17", "targetname");
	donut_target17 Hide();
	donut_trig18 = GetEnt("donut_trig18", "targetname");
	donut_trig18 Hide();
	donut_target18 = GetEnt("donut_target18", "targetname");
	donut_target18 Hide();
	donut_trig19 = GetEnt("donut_trig19", "targetname");
	donut_trig19 Hide();
	donut_target19 = GetEnt("donut_target19", "targetname");
	donut_target19 Hide();
	donut_trig20 = GetEnt("donut_trig20", "targetname");
	donut_trig20 Hide();
	donut_target20 = GetEnt("donut_target20", "targetname");
	donut_target20 Hide();
	bunker_message = GetEnt("bunker_message", "targetname");
	bunker_message Hide();
	bossfight_tele_rad = GetEnt("bossfight_tele_rad", "targetname");
	bossfight_tele_rad Hide();
	galaxy_donut = GetEnt("galaxy_donut", "targetname");
	galaxy_donut Hide();
	bossfight_tele_rad1 = GetEnt("bossfight_tele_rad1", "targetname");
	bossfight_tele_rad1 Hide();
	bossfight_tele_rad2 = GetEnt("bossfight_tele_rad2", "targetname");
	bossfight_tele_rad2 Hide();
	bossfight_tele_rad3 = GetEnt("bossfight_tele_rad3", "targetname");
	bossfight_tele_rad3 Hide();
	escape_heli = GetEnt("escape_heli", "targetname");
	escape_heli Hide();
	ending = GetEnt("ending", "targetname");
	ending Hide();

	//Sets up trigger to talk to Nathan
	n_talk1 = GetEnt("n_talk1", "targetname");
	n_talk1 SetHintString("Hold ^3[{+activate}]^7 to talk to Nathan");
	n_talk1 waittill("trigger", player);


	//Gets all players to play Nathan Talking
	players = GetPlayers();
	for (i = 0;i<players.size;i++)
	{
		players[i] PlayLocalSound("nathan_q1");
	}


	n_talk1 Delete();
	//Waits for Nathan to shut up
	wait 16;
	IPrintLnBold("Objective:Find and give Nathan the SpongeBob Vape");

	//Calls Step 2
	thread step_two();
}


function step_two()
{
	cashier_vape = GetEnt("cashier_vape", "targetname");
	spongebob_vape = GetEnt("spongebob_vape", "targetname");
	spongebob_vape SetHintString("Hold ^3[{+activate}]^7 pick up vape");
	spongebob = GetEnt("spongebob", "targetname");
	spongebob_vape waittill("trigger", player);
	spongebob PlaySound("hi_spongebob");
	spongebob_vape Delete();
	spongebob Delete();

	pay_clip = GetEnt("pay_clip", "targetname");
	pay_clip Show();

	pay_trigger = GetEnt("pay_trigger", "targetname");
	pay_trigger waittill("trigger", player);

	pay_trigger Delete();

	players = GetPlayers();
	for (i = 0;i<players.size;i++)
	players[i] PlayLocalSound("vape_q1");

	wait 4;

	pay_cashier = GetEnt("pay_cashier", "targetname");
	pay_cashier SetHintString("Hold ^3[{+activate}]^7 to talk to the cashier");
	pay_cashier waittill("trigger", player);
	cashier_vape Show();
	pay_cashier PlaySound("vape_q2");
	pay_cashier Hide();

	wait 3;

	pay_cashier Show();
	pay_cashier SetHintString("Hold ^3[{+activate}]^7 to tell the cashier your broke");
	pay_cashier waittill("trigger", player);
	pay_cashier PlaySound("vape_q3");

	pay_cashier Hide();

	wait 9;

	pay_clip Delete();

	IPrintLnBold("Objective:Find a way to clean the bathroom");


	thread step_three();
}

function step_three()
{
	level.clean_count = 0;
	level.clean_complete = 2;

	thread cleaning_supplies();
	thread plunger();
}



function cleaning_supplies()
{
	cleaning = GetEnt("cleaning", "targetname");
	cleaning_clip = GetEnt("cleaning_clip", "targetname");
	cleaning_trigger = GetEnt("cleaning_trigger", "targetname");

	cleaning_trigger SetHintString("Hold ^3[{+activate}]^7 to grab cleaning supplies");
	cleaning_trigger waittill("trigger", player);

	cleaning PlaySound("cleaning_supplies");
	cleaning Delete();
	cleaning_clip Delete();
	cleaning_trigger Delete();
	level.clean_count++;
	thread clean_bathroom();
}

function plunger()
{
	plunger = GetEnt("plunger", "targetname");
	plunger_clip = GetEnt("plunger_clip", "targetname");
	plunger_trigger = GetEnt("plunger_trigger", "targetname");

	plunger_trigger SetHintString("Hold ^3[{+activate}]^7 to grab the plunger");
	plunger_trigger waittill("trigger", player);

	plunger PlaySound("plunger_sfx");

	plunger_trigger Delete();
	plunger Delete();
	plunger_clip Delete();
	level.clean_count++;
	thread clean_bathroom();
}


function clean_bathroom()
{
	if(level.clean_count >= level.clean_complete)	
	{
		level.bathroom_count = 0;
		level.bathroom_clean_complete = 5;
		thread poop_toilet();
		thread normal_poop1();
		thread normal_poop2();
		thread giant_poop();
		thread normal_poop3();
	}
}


function poop_toilet()
{
	bathroom_clean1 = GetEnt("bathroom_clean1", "targetname");
	poop1 = GetEnt("poop1", "targetname");
	poop5 = GetEnt("poop5", "targetname");

	bathroom_clean1 SetHintString("Hold ^3[{+activate}]^7 to unclog the toilet");
	bathroom_clean1 waittill("trigger", player);
	bathroom_clean1 PlaySound("poop_clean");
	bathroom_clean1 Delete();
	poop1 Delete();
	poop5 Delete();
	level.bathroom_count++;
	thread step_four();
}

function normal_poop1()
{
	bathroom_clean2 = GetEnt("bathroom_clean2", "targetname");
	poop2 = GetEnt("poop2", "targetname");
	poop2_clip = GetEnt("poop2_clip", "targetname");

	bathroom_clean2 SetHintString("Hold ^3[{+activate}]^7 to clean the shit");
	bathroom_clean2 waittill("trigger", player);
	bathroom_clean2 PlaySound("normal_poop");
	bathroom_clean2 Delete();
	poop2 Delete();
	poop2_clip Delete();
	level.bathroom_count++;
	thread step_four();

}

function normal_poop2()
{
	bathroom_clean3 = GetEnt("bathroom_clean3", "targetname");
	poop3 = GetEnt("poop3", "targetname");
	poop3_clip = GetEnt("poop3_clip", "targetname");

	bathroom_clean3 SetHintString("Hold ^3[{+activate}]^7 to clean the shit");
	bathroom_clean3 waittill("trigger", player);
	bathroom_clean3 PlaySound("normal_poop");
	poop3 Delete();
	bathroom_clean3 Delete();
	poop3_clip Delete();
	level.bathroom_count++;
	thread step_four();
}


function giant_poop()
{
	bathroom_clean4 = GetEnt("bathroom_clean4", "targetname");
	poop4 = GetEnt("poop4", "targetname");
	poop4_clip = GetEnt("poop4_clip", "targetname");

	bathroom_clean4 SetHintString("Hold ^3[{+activate}]^7 to clean the giant shit");
	bathroom_clean4 waittill("trigger", player);
	bathroom_clean4 PlaySound("giant_poop");
	bathroom_clean4 Delete();
	poop4 Delete();
	poop4_clip Delete();
	level.bathroom_count++;
	thread step_four();
}

function normal_poop3()
{
	bathroom_clean5 = GetEnt("bathroom_clean5", "targetname");
	bathroom_clean5 SetHintString("Hold ^3[{+activate}]^7 to clean shit");
	poop6 = GetEnt("poop6", "targetname");
	bathroom_clean5 waittill("trigger", player);
	poop6 PlaySound("normal_poop");
	poop6 Delete();
	bathroom_clean5 Delete();
	level.bathroom_count++;
	thread step_four();
}

function step_four()
{
	if(level.bathroom_count >= level.bathroom_clean_complete)
	{
		cashier_vape = GetEnt("cashier_vape", "targetname");
		nathan_panel = GetEnt("nathan_panel", "targetname");
		nathan_panel Hide();
		buy_vape = GetEnt("buy_vape", "targetname");
		buy_vape SetHintString("Hold ^3[{+activate}]^7 to talk to the cashier");
		buy_vape waittill("trigger", player);
		buy_vape PlaySound("vape_q4");
		buy_vape Delete();
		cashier_vape Delete();
		wait 3;
		n_talk2 = GetEnt("n_talk2", "targetname");
		n_talk2 SetHintString("Hold ^3[{+activate}]^7 to give Nathan the vape");
		n_talk2 waittill("trigger", player);
		players = GetPlayers();
		for (i = 0;i<players.size;i++)
		{
			players[i] PlayLocalSound("nathan_q2");
		}
		n_talk2 Delete();
		wait 36;
		panel_grab1 = GetEnt("panel_grab1", "targetname");
		panel_grab1 SetHintString("Hold ^3[{+activate}]^7 to grab the panel");
		nathan_panel Show();
		panel_grab1 waittill("trigger", player);
		panel_grab1 Delete();
		nathan_panel Delete();
		panel_place = GetEnt("panel_place", "targetname");
		panel_place_trig = GetEnt("panel_place_trig", "targetname");
		panel_place_trig SetHintString("Hold ^3[{+activate}]^7 to place panel");
		panel_place_trig waittill("trigger", player);
		panel_place Show();
		panel_place_trig Delete();

		player = GetPlayers();

		level.count = 0;

		panel_activate_trig = GetEnt("panel_activate_trig", "targetname");
		panel_activate_trig SetHintString("Hold ^3[{+activate}]^7 to place panel ^1(All Players Must be Near)"); 
		panel_activate_trig waittill("trigger", player);

		const maxRadius = 75; // radius from trigger all players need to be within

		while(isdefined(panel_activate_trig))
		{
		        b_canUse = true;

		        foreach(player in getplayers())
		        {
		            
		            // Check if the player is in spectator mode
		            if(player.sessionstate == "spectator")
		            {
		            	b_canUse = false;
		            	break;
		            }
		            
		            // Check distance between player and trigger
		            distsqrd = DistanceSquared(player.origin, panel_activate_trig.origin);
		            if(distsqrd >= maxRadius * maxRadius)
		            {
		                // If any player is outside the activation radius, trigger cannot be used
		                b_canUse = false;
		                // Break out of the loop since trigger cannot be used
		                break;
		            }
		        }

		        // If all players are not down and within the activation radius, trigger can be used
		        if(b_canUse)
		        {
		            // Delete the trigger since it has been successfully used
		            panel_activate_trig Delete();
		            // Exit the loop since trigger has been used
		            break;
		        }

		        // Wait for a short duration before rechecking trigger activation conditions
		        wait 0.5;
		    }






		lockdown_clip = GetEnt("lockdown_clip", "targetname");
		lockdown_clip Show();
		lockdown_barrier = GetEnt("lockdown_barrier", "targetname");
		lockdown_barrier Show();

		lockdown_clip1 = GetEnt("lockdown_clip1", "targetname");
		lockdown_clip1 Show();
		lockdown_barrier1 = GetEnt("lockdown_barrier1", "targetname");
		lockdown_barrier1 Show();

		tower_strike = GetEnt("tower_strike", "targetname");
		lockdown_charged = GetEnt("lockdown_charged", "targetname");

		currentRound = undefined;
		roundCheck = undefined;
		currentRound = zm::get_round_number();
		nextRound = currentRound + 1;



		thread goto_round(nextRound);

		roundCheck = currentRound + 4;

		while(roundCheck != currentRound)
		{
			wait 1;
			currentRound = undefined;
			currentRound = zm::get_round_number();
		}


		lockdown_barrier Delete();
		lockdown_clip Delete();
		lockdown_barrier1 Delete();
		lockdown_clip1 Delete();
		PlayFX("dlc1/castle/fx_lightning_strike_weathervane", tower_strike GetOrigin());
		PlayFX("dlc1/castle/fx_battery_lightning_castle", lockdown_charged GetOrigin());

		players = GetPlayers();
		for (i = 0;i<player.size;i++)
		{
			players[i] PlayLocalSound("lightning_strike");
		}



		thread step_five();
		thread lightning_loop();
	}
}



function goto_round(round_number = undefined)
{
    if(!isdefined(round_number))
        round_number = zm::get_round_number();
    if(round_number == zm::get_round_number())
        return;
    if(round_number < 0)
        return;

    // kill_round by default only exists in debug mode
    /#
    level notify("kill_round");
    #/
    // level notify("restart_round");
    level notify("end_of_round");
    level.zombie_total = 0;
    zm::set_round_number(round_number);
    round_number = zm::get_round_number(); // get the clamped round number (max 255)

    zombie_utility::ai_calculate_health(round_number);
    SetRoundsPlayed(round_number);

    foreach(zombie in zombie_utility::get_round_enemy_array())
    {
        zombie Kill();
    }

    if(level.gamedifficulty == 0)
        level.zombie_move_speed = round_number * level.zombie_vars["zombie_move_speed_multiplier_easy"];
    else
        level.zombie_move_speed = round_number * level.zombie_vars["zombie_move_speed_multiplier"];

    level.zombie_vars["zombie_spawn_delay"] = [[level.func_get_zombie_spawn_delay]](round_number);

    level.sndGotoRoundOccurred = true;
    level waittill("between_round_over");
}

function lightning_loop()
{
	tower_strike = GetEnt("tower_strike", "targetname");
	while(1)
	{
		wait 12;
		PlayFX("dlc1/castle/fx_lightning_strike_weathervane", tower_strike GetOrigin());
		tower_strike PlaySound("lightning_strike");
	}



}


function step_five()
{
	n_talk3 = GetEnt("n_talk3", "targetname");
	n_talk3 SetHintString("Hold ^3[{+activate}]^7 to talk to Nathan");
	n_talk3 waittill("trigger", player);
	n_talk3 Delete();
	players = GetPlayers();
	for (i = 0;i<players.size;i++)
	{
		players[i] PlayLocalSound("nathan_q3");
	}
	wait 17;
	currentRound = undefined;
	roundCheck = undefined;
	currentRound = zm::get_round_number();
	roundCheck = CurrentRound + 1;
	while(roundCheck != currentRound)
	{
		wait 5;
		currentRound = undefined;
		currentRound = zm::get_round_number();
	}
	
	n_talk4 = GetEnt("n_talk4", "targetname");
	n_talk4 SetHintString("Hold ^3[{+activate}]^7 to talk to Nathan");
	n_talk4 waittill("trigger", player);
	n_talk4 Delete();
	for (i = 0;i<players.size;i++)
	{
		players[i] PlayLocalSound("nathan_q4");
	}
	wait 12;
	thread step_six();
}


function step_six()
{
	john_q1 = GetEnt("john_q1", "targetname");
	john_q1 SetHintString("Hold ^3[{+activate}]^7 to talk to John Pork");
	john_q1 waittill("trigger", player);
	john_q1 Delete();
	players = GetPlayers();
	for (i = 0;i<players.size;i++)
	{
		players[i] PlayLocalSound("john_q1");
	}
	wait 29;
	IPrintLnBold("Objective:Find the bunker, and obtain 3 keys");
	level.keys_needed = 3;
	level.keys_grabbed = 0;
	level.bunker_open = 0;

	thread donut_lockdown();
	thread donut_targets();
	thread key();
}

function donut_lockdown()
{
	donut_lockdown_trig = GetEnt("donut_lockdown_trig", "targetname");
	donut_lockdown_trig SetHintString("Hold ^3[{+activate}]^7 to Scan the Building ^1(All Players must be Near!)");
	donut_lockdown_trig waittill("trigger", player);

	const maxRadius = 125; // radius from trigger all players need to be within

		while(isdefined(donut_lockdown_trig))
		{
		        b_canUse = true;

		        foreach(player in getplayers())
		        {
		            
		            // Check if the player is in spectator mode
		            if(player.sessionstate == "spectator")
		            {
		            	b_canUse = false;
		            	break;
		            }
		            
		            // Check distance between player and trigger
		            distsqrd = DistanceSquared(player.origin, donut_lockdown_trig.origin);
		            if(distsqrd >= maxRadius * maxRadius)
		            {
		                // If any player is outside the activation radius, trigger cannot be used
		                b_canUse = false;
		                // Break out of the loop since trigger cannot be used
		                break;
		            }
		        }

		        // If all players are not down and within the activation radius, trigger can be used
		        if(b_canUse)
		        {
		            // Delete the trigger since it has been successfully used
		            donut_lockdown_trig Delete();
		            // Exit the loop since trigger has been used
		            break;
		        }

		        // Wait for a short duration before rechecking trigger activation conditions
		        wait 0.5;
		    }
	currentRound = undefined;
	roundCheck = undefined;
	currentRound = zm::get_round_number();
	nextRound = currentRound + 1;



	thread goto_round(nextRound);

	roundCheck = currentRound + 3;

	donut_lockdown_d1 = GetEnt("donut_lockdown_d1", "targetname");
	donut_lockdown_d2 = GetEnt("donut_lockdown_d2", "targetname");
	donut_lockdown_clip1 = GetEnt("donut_lockdown_clip1", "targetname");
	donut_lockdown_clip2 = GetEnt("donut_lockdown_clip2", "targetname");
	donut_lockdown_d3 = GetEnt("donut_lockdown_d3", "targetname");
	donut_lockdown_clip3 = GetEnt("donut_lockdown_clip3", "targetname");

	donut_lockdown_d1 Show();
	donut_lockdown_clip1 Show();
	donut_lockdown_d2 Show();
	donut_lockdown_clip2 Show();
	donut_lockdown_d3 Show();
	donut_lockdown_clip3 Show();

	while(roundCheck != currentRound)
	{
		wait 1;
		currentRound = undefined;
		currentRound = zm::get_round_number();
	}

	donut_lockdown_d1 Delete();
	donut_lockdown_clip1 Delete();
	donut_lockdown_d2 Delete();
	donut_lockdown_clip2 Delete();
	donut_lockdown_d3 Delete();
	donut_lockdown_clip3 Delete();
	bunker_door_wall = GetEnt("bunker_door_wall", "targetname");
	bunker_door_wall Delete();
	thread bunker_door_message();
	IPrintLnBold("Bunker Door is now Accessible");
	key2 = GetEnt("key2","targetname");
	key_trig2 = GetEnt("key_trig2", "targetname");
	key2 Show();
	key_trig2 SetHintString("Hold ^3[{+activate}]^7 to Pickup Key");
	key_trig2 Show();
	key_trig2 waittill("trigger", player);
	key_trig2 Delete();
	key2 PlaySound("key_pickup");
	key2 Delete();
	level.keys_grabbed++;
	thread key_completed();
}


function bunker_door_message()
{
	bunker_message = GetEnt("bunker_message", "targetname");
	bunker_message Show();
	while (level.bunker_open == 0)
	{
		bunker_message SetHintString("Door Requires 3 Keys to Open...");
		bunker_message waittill("trigger", player);
	}
}

function donut_targets()
{
	level.donut_check = 0;
	level.donut_complete = 20;
	level.playSoundLocation = GetEnt("easter_egg_sound_location", "SpookySkeletons"); // Create a script origin and set it to server, not client, then give it this targetname

	thread donut1();
	wait 1;
	thread donut2();
	wait 1;
	thread donut3();
	wait 1;
	thread donut4();
	wait 1;
	thread donut5();
	wait 1;
	thread donut6();
	wait 1;
	thread donut7();
	wait 1;
	thread donut8();
	wait 1;
	thread donut9();
	wait 1;
	thread donut10();
	wait 1;
	thread donut11();
	wait 1;
	thread donut12();
	wait 1;
	thread donut13();
	wait 1;
	thread donut14();
	wait 1;
	thread donut15();
	wait 1;
	thread donut16();
	wait 1;
	thread donut17();
	wait 1;
	thread donut18();
	wait 1;
	thread donut19();
	wait 1;
	thread donut20();
}

function donut1()
{
	donut_trig1 = GetEnt("donut_trig1", "targetname");
	donut_target1 = GetEnt("donut_target1", "targetname");
	donut_target1 Show();
	donut_trig1 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig1 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target1 GetOrigin());
	donut_target1 PlaySound("donut_target_sound");
	donut_target1 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut2()
{
	donut_trig2 = GetEnt("donut_trig2", "targetname");
	donut_target2 = GetEnt("donut_target2", "targetname");
	donut_target2 Show();
	donut_trig2 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig2 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target2 GetOrigin());
	donut_target2 PlaySound("donut_target_sound");
	donut_target2 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut3()
{
	donut_trig3 = GetEnt("donut_trig3", "targetname");
	donut_target3 = GetEnt("donut_target3", "targetname");
	donut_target3 Show();
	donut_trig3 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig3 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target3 GetOrigin());
	donut_target3 PlaySound("donut_target_sound");
	donut_target3 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}

function donut4()
{
	donut_trig4 = GetEnt("donut_trig4", "targetname");
	donut_target4 = GetEnt("donut_target4", "targetname");
	donut_target4 Show();
	donut_trig4 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig4 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target4 GetOrigin());
	donut_target4 PlaySound("donut_target_sound");
	donut_target4 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut5()
{
	donut_trig5 = GetEnt("donut_trig5", "targetname");
	donut_target5 = GetEnt("donut_target5", "targetname");
	donut_target5 Show();
	donut_trig5 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig5 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target5 GetOrigin());
	donut_target5 PlaySound("donut_target_sound");
	donut_target5 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut6()
{
	donut_trig6 = GetEnt("donut_trig6", "targetname");
	donut_target6 = GetEnt("donut_target6", "targetname");
	donut_target6 Show();
	donut_trig6 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig6 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target6 GetOrigin());
	donut_target6 PlaySound("donut_target_sound");
	donut_target6 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut7()
{
	donut_trig7 = GetEnt("donut_trig7", "targetname");
	donut_target7 = GetEnt("donut_target7", "targetname");
	donut_target7 Show();
	donut_trig7 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig7 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target7 GetOrigin());
	donut_target7 PlaySound("donut_target_sound");
	donut_target7 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut8()
{
	donut_trig8 = GetEnt("donut_trig8", "targetname");
	donut_target8 = GetEnt("donut_target8", "targetname");
	donut_target8 Show();
	donut_trig8 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig8 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target8 GetOrigin());
	donut_target8 PlaySound("donut_target_sound");
	donut_target8 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut9()
{
	donut_trig9 = GetEnt("donut_trig9", "targetname");
	donut_target9 = GetEnt("donut_target9", "targetname");
	donut_target9 Show();
	donut_trig9 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig9 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target9 GetOrigin());
	donut_target9 PlaySound("donut_target_sound");
	donut_target9 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut10()
{
	donut_trig10 = GetEnt("donut_trig10", "targetname");
	donut_target10 = GetEnt("donut_target10", "targetname");
	donut_target10 Show();
	donut_trig10 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig10 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target10 GetOrigin());
	donut_target10 PlaySound("donut_target_sound");
	donut_target10 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut11()
{
	donut_trig11 = GetEnt("donut_trig11", "targetname");
	donut_target11 = GetEnt("donut_target11", "targetname");
	donut_target11 Show();
	donut_trig11 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig11 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target11 GetOrigin());
	donut_target11 PlaySound("donut_target_sound");
	donut_target11 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut12()
{
	donut_trig12 = GetEnt("donut_trig12", "targetname");
	donut_target12 = GetEnt("donut_target12", "targetname");
	donut_target12 Show();
	donut_trig12 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig12 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target12 GetOrigin());
	donut_target12 PlaySound("donut_target_sound");
	donut_target12 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut13()
{
	donut_trig13 = GetEnt("donut_trig13", "targetname");
	donut_target13 = GetEnt("donut_target13", "targetname");
	donut_target13 Show();
	donut_trig13 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig13 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target13 GetOrigin());
	donut_target13 PlaySound("donut_target_sound");
	donut_target13 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut14()
{
	donut_trig14 = GetEnt("donut_trig14", "targetname");
	donut_target14 = GetEnt("donut_target14", "targetname");
	donut_target14 Show();
	donut_trig14 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig14 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target14 GetOrigin());
	donut_target14 PlaySound("donut_target_sound");
	donut_target14 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut15()
{
	donut_trig15 = GetEnt("donut_trig15", "targetname");
	donut_target15 = GetEnt("donut_target15", "targetname");
	donut_target15 Show();
	donut_trig15 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig15 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target15 GetOrigin());
	donut_target15 PlaySound("donut_target_sound");
	donut_target15 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut16()
{
	donut_trig16 = GetEnt("donut_trig16", "targetname");
	donut_target16 = GetEnt("donut_target16", "targetname");
	donut_target16 Show();
	donut_trig16 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig16 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target16 GetOrigin());
	donut_target16 PlaySound("donut_target_sound");
	donut_target16 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut17()
{
	donut_trig17 = GetEnt("donut_trig17", "targetname");
	donut_target17 = GetEnt("donut_target17", "targetname");
	donut_target17 Show();
	donut_trig17 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig17 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target17 GetOrigin());
	donut_target17 PlaySound("donut_target_sound");
	donut_target17 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut18()
{
	donut_trig18 = GetEnt("donut_trig18", "targetname");
	donut_target18 = GetEnt("donut_target18", "targetname");
	donut_target18 Show();
	donut_trig18 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig18 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target18 GetOrigin());
	donut_target18 PlaySound("donut_target_sound");
	donut_target18 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut19()
{
	donut_trig19 = GetEnt("donut_trig19", "targetname");
	donut_target19 = GetEnt("donut_target19", "targetname");
	donut_target19 Show();
	donut_trig19 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig19 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target19 GetOrigin());
	donut_target19 PlaySound("donut_target_sound");
	donut_target19 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}
function donut20()
{
	donut_trig20 = GetEnt("donut_trig20", "targetname");
	donut_target20 = GetEnt("donut_target20", "targetname");
	donut_target20 Show();
	donut_trig20 waittill("trigger", player);
	level.donut_check++;
	thread donut_finished();
	donut_trig20 Delete();
	PlayFX("dlc1/castle/fx_ee_keeper_demonhead_despawn", donut_target20 GetOrigin());
	donut_target20 PlaySound("donut_target_sound");
	donut_target20 Delete();
	IPrintLnBold(level.donut_check + "/20 Donuts Found");
}

function donut_finished()
{
	if (level.donut_check >= level.donut_complete)
	{

		players = GetPlayers();
		for (i = 0;i<players.size;i++)
		{
			players[i] PlayLocalSound("donut_completion");
		}
		key3 = GetEnt("key3", "targetname");
		key_trig3 = GetEnt("key_trig3", "targetname");
		key3 Show();
		key_trig3 SetHintString("Hold ^3[{+activate}]^7 to Pickup Key");
		key_trig3 Show();
		key_trig3 waittill("trigger", player);
		key_trig3 Delete();
		key3 PlaySound("key_pickup");
		key3 Delete();
		level.keys_grabbed++;
		thread key_completed();
	}
}


function key()
{
	key1 = GetEnt("key1","targetname");
	key1_trig = GetEnt("key1_trig", "targetname");
	key1 Show();
	key1_trig SetHintString("Hold ^3[{+activate}]^7 to Pickup Key");
	key1_trig Show();
	key1_trig waittill("trigger", player);
	key1_trig Delete();
	key1 PlaySound("key_pickup");
	key1 Delete();
	level.keys_grabbed++;
	thread key_completed();
}

function key_completed()
{
	if (level.keys_grabbed >= level.keys_needed)
	{
		level.power = false;
		bunker_message = GetEnt("bunker_message", "targetname");
		bunker_message Delete();
		electric_door_message = GetEnt("electric_door_message", "targetname");
		thread step_seven();
		while(level.power == false)
		{
			electric_door_message SetHintString("This Door Requires Power...");
			electric_door_message waittill("trigger", player);
		}
	}

}


function step_seven()
{
	IPrintLnBold("All Keys Obtained...");	
	level.bunker_open = 1;	
	bunker_door = GetEnt("bunker_door", "targetname");
	bunker_open_door = GetEnt("bunker_open_door", "targetname");
	bunker_open_door SetHintString("Hold ^3[{+activate}]^7 to Open Door");
	bunker_open_door waittill("trigger", player);
	bunker_clip = GetEnt("bunker_clip", "targetname");
	bunker_clip Delete();
	bunker_open_door Delete();
	bunker_door Delete();

	n_talk5 = GetEnt("n_talk5", "targetname");
	n_talk5 SetHintString("Hold ^3[{+activate}]^7 to Talk to Nathan");
	n_talk5 waittill("trigger", player);
	n_talk5 Delete();

	players = GetPlayers();
	for (i = 0;i<players.size;i++)
	{
		players[i] PlayLocalSound("nathan_q5");
	}
	wait 23;
	IPrintLnBold("Objective:Find and Fill all Soul Boxes");
	thread step_eight();
}

function step_eight()
{
	grow_soul::init(  );
	thread final_teleporters();
}


function final_teleporters()
{
	final_teleport1 = GetEnt("final_teleport1", "targetname");
	final_teleport1 SetHintString("Hold ^3[{+activate}]^7 to Teleport to Donut Shop");
	thread final_teleporters2();
	thread final_teleporters3();
	thread final_teleporters4();
	player_tp = GetEntArray( "final_teleport1", "targetname");
	for( i = 0; i < player_tp.size; i++ )
	{
		player_tp[i] thread player_final_teleport();
	}
}

function final_teleporters2()
{
	final_teleport2 = GetEnt("final_teleport2", "targetname");
	final_teleport2 SetHintString("Hold ^3[{+activate}]^7 to Teleport to House");
	player_tp = GetEntArray( "final_teleport2", "targetname");
	for( i = 0; i < player_tp.size; i++ )
	{
		player_tp[i] thread player_final_teleport2();
	}
}

function final_teleporters3()
{
	final_teleport3 = GetEnt("final_teleport3", "targetname");
	final_teleport3 SetHintString("Hold ^3[{+activate}]^7 to Teleport to Vape Shop");
	player_tp = GetEntArray( "final_teleport3", "targetname");
	for( i = 0; i < player_tp.size; i++ )
	{
		player_tp[i] thread player_final_teleport3();
	}
}

function final_teleporters4()
{
	final_teleport4 = GetEnt("final_teleport4", "targetname");
	final_teleport4 SetHintString("Hold ^3[{+activate}]^7 to Teleport to Nathan's House");
	player_tp = GetEntArray( "final_teleport4", "targetname");
	for( i = 0; i < player_tp.size; i++ )
	{
		player_tp[i] thread player_final_teleport4();
	}
}

function player_final_teleport4()
{
	destination = GetEnt( self.target, "targetname" );
	while(1)
	{
		self waittill( "trigger", player );
		player SetOrigin( destination.origin );
		player SetPlayerAngles( destination.angles );
		player EnableInvulnerability();
		final_teleport4 = GetEnt("final_teleport4", "targetname");
		final_teleport4 SetHintString("On Cooldown...");
		wait 5;
		final_teleport4 SetHintString("Hold ^3[{+activate}]^7 to Teleport to Nathan's House");
		player DisableInvulnerability();
	}
}


function player_final_teleport3()
{
	destination = GetEnt( self.target, "targetname" );
	while(1)
	{
		self waittill( "trigger", player );
		player SetOrigin( destination.origin );
		player SetPlayerAngles( destination.angles );
		player EnableInvulnerability();
		final_teleport3 = GetEnt("final_teleport3", "targetname");
		final_teleport3 SetHintString("On Cooldown...");
		wait 5;
		final_teleport3 SetHintString("Hold ^3[{+activate}]^7 to Teleport to Vape Shop");
		player DisableInvulnerability();
	}
}

function player_final_teleport2()
{
	destination = GetEnt( self.target, "targetname" );
	while(1)
	{
		self waittill( "trigger", player );
		player SetOrigin( destination.origin );
		player SetPlayerAngles( destination.angles );
		player EnableInvulnerability();
		final_teleport2 = GetEnt("final_teleport2", "targetname");
		final_teleport2 SetHintString("On Cooldown...");
		wait 5;
		final_teleport2 SetHintString("Hold ^3[{+activate}]^7 to Teleport to House");
		player DisableInvulnerability();
	}
}

function player_final_teleport()
{
	destination = GetEnt( self.target, "targetname" );
	while(1)
	{
		self waittill( "trigger", player );
		player SetOrigin( destination.origin );
		player SetPlayerAngles( destination.angles );
		player EnableInvulnerability();
		final_teleport1 = GetEnt("final_teleport1", "targetname");
		final_teleport1 SetHintString("On Cooldown...");
		wait 5;
		final_teleport1 SetHintString("Hold ^3[{+activate}]^7 to Teleport to Donut Shop");
		player DisableInvulnerability();
	}
}