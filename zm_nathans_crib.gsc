#using scripts\codescripts\struct;
#using scripts\zm\_zm_score;

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

//Perks
#using scripts\zm\_zm_pack_a_punch;
#using scripts\zm\_zm_pack_a_punch_util;
#using scripts\zm\_zm_perk_additionalprimaryweapon;
#using scripts\zm\_zm_perk_doubletap2;
#using scripts\zm\_zm_perk_deadshot;
#using scripts\zm\_zm_perk_juggernaut;
#using scripts\zm\_zm_perk_quick_revive;
#using scripts\zm\_zm_perk_sleight_of_hand;
#using scripts\zm\_zm_perk_staminup;
#using scripts\zm\logical\perks\_zm_perk_ffyl;
#using scripts\zm\logical\perks\_zm_perk_icu;
#using scripts\zm\logical\perks\_zm_perk_tactiquilla;
#using scripts\zm\_zm_perk_electric_cherry;
#using scripts\zm\_zm_perk_widows_wine;
#using scripts\zm\_zm_perk_vulture_aid;
#using scripts\zm\_zm_perk_phdflopper;
#using scripts\zm\_zm_perk_random;
#using scripts\zm\ugxmods_buyable_ending;



// MECHZ ZOMBIE
#using scripts\zm\_zm_ai_mechz;


//Powerups
#using scripts\zm\_zm_powerup_double_points;
#using scripts\zm\_zm_powerup_carpenter;
#using scripts\zm\_zm_powerup_fire_sale;
#using scripts\zm\_zm_powerup_free_perk;
#using scripts\zm\_zm_powerup_full_ammo;
#using scripts\zm\_zm_powerup_insta_kill;
#using scripts\zm\_zm_powerup_nuke;
//#using scripts\zm\_zm_powerup_weapon_minigun;



//Traps
#using scripts\zm\_zm_trap_electric;

#using scripts\zm\zm_usermap;
// Sphynx's Console Commands
#using scripts\Sphynx\commands\_zm_commands;
#using scripts\Sphynx\commands\_zm_name_checker;
// Power Switch
#using scripts\zm\zm_power_switch_animated;
//Power door script
#using scripts\zm\zm_power_door;
//Easter egg
#using scripts\zm\zm_nathans_crib_easter_egg;



//Effects

//Bear FX
#precache( "fx", "explosions/fx_exp_smk_tendril_sm_os_evb" );
#precache( "fx", "dlc1/castle/fx_elec_jumppad_amb_ext_ring" );


//*****************************************************************************
// MAIN
//*****************************************************************************

function main()
{
	//donut teleports
	level.teleport_cost = 1500;
	level.donut_link = 0;
	//Pack A Punch Camo Override
	level.pack_a_punch_camo_index = 132;
	level.pack_a_punch_camo_index_number_variants = 1;
	level._zombie_custom_add_weapons =&custom_add_weapons;

	zm_usermap::main();


	level.perk_purchase_limit = 30;
	
	level._zombie_custom_add_weapons =&custom_add_weapons;

	
	//Setup the levels Zombie Zone Volumes
	level.zones = [];
	level.zone_manager_init_func =&usermap_test_zone_init;
	init_zones[0] = "start_zone";
	level thread zm_zonemgr::manage_zones( init_zones );

	level.pathdist_type = PATHDIST_ORIGINAL;

	// Change Starting Weapon
 	startingWeapon = "s2_luger";
 	weapon = getWeapon(startingWeapon);
 	level.start_weapon = (weapon);
	// Easter Egg Song
	thread soundEasterEggInit();
	//auto zones
	thread iceGrenade_autoZones();
	//Teleport into Nathan's house
	player_teleporter_init();
	player_teleporter_init_one();
	//music
	thread player_music();
	thread player_music_one();
	thread player_music_two();
	thread player_music_three();

	//pack quest
	thread pack_quest_main();

	//donut teleport
	thread donut_start();
}

function usermap_test_zone_init()
{
	level flag::init( "always_on" );
	level flag::set( "always_on" );
	//start zone to zone 2
	zm_zonemgr::add_adjacent_zone( "start_zone", "zone_2", "activate_zone_2");

	//zone 2 to zone 3 
	zm_zonemgr::add_adjacent_zone( "zone_2", "zone_3", "activate_zone_3");

	//zone 3 to zone 4
	zm_zonemgr::add_adjacent_zone( "zone_3", "zone_4", "zone3-1");

	//zone 2 to zone 5
	zm_zonemgr::add_adjacent_zone( "zone_2", "zone_5", "activate_zone_5");

	//zone 4 to zone 5
	zm_zonemgr::add_adjacent_zone( "zone_4", "zone_5", "zone4-1");

	//zone 4 to zone 6
	zm_zonemgr::add_adjacent_zone( "zone_4", "zone_6", "activate_zone_6");
	//zone6 to zone 7
	zm_zonemgr::add_adjacent_zone( "zone_6", "zone_7", "activate_zone_7");


	//zone6 to streetzone1
	zm_zonemgr::add_adjacent_zone( "zone_6", "street_zone1", "activate_street_zone1");
	//street_zone1 to street_zone2
	zm_zonemgr::add_adjacent_zone( "street_zone1", "street_zone2", "activate_street_zone2");
	//street_zone2 to street_zone3
	zm_zonemgr::add_adjacent_zone( "street_zone2", "street_zone3", "activate_street_zone3");
	//street_zone1 to street_zone4
	zm_zonemgr::add_adjacent_zone( "street_zone1", "street_zone4", "activate_street_zone4");
	//street_zone4 to street_zone5
	zm_zonemgr::add_adjacent_zone( "street_zone4", "street_zone5", "activate_street_zone5");
	//street_zone5 to street_zone6
	zm_zonemgr::add_adjacent_zone( "street_zone5", "street_zone6", "activate_street_zone6");
	//street_zone6 to street_zone7
	zm_zonemgr::add_adjacent_zone( "street_zone6", "street_zone7", "activate_street_zone7");
	//street_zone7 to street_zone8
	zm_zonemgr::add_adjacent_zone( "street_zone7", "street_zone8", "activate_street_zone8");

	
	//street_zone3 to vape_zone1
	zm_zonemgr::add_adjacent_zone( "street_zone3", "store_zone1", "activate_store_zone1");
	//vape_zone1 to vape_zone2
	zm_zonemgr::add_adjacent_zone( "store_zone1", "store_zone2", "activate_store_zone2");


	//street_zone6 to house_zone1
	zm_zonemgr::add_adjacent_zone( "street_zone6", "house_zone1", "activate_house_zone1");
	//house_zone1 to house_zone2
	zm_zonemgr::add_adjacent_zone( "house_zone1", "house_zone2", "activate_house_zone2");
	//house_zone1 to house_zone3
	zm_zonemgr::add_adjacent_zone( "house_zone1", "house_zone3", "activate_house_zone3");

	
	//zone_2 to zone_2c
	zm_zonemgr::add_adjacent_zone( "zone_2", "zone_2c", "activate_zone_2c");
	//zone_2 to zone_2b
	zm_zonemgr::add_adjacent_zone( "zone_2", "zone_2b", "activate_zone_2b");
	//zone_3 to zone_2b
	zm_zonemgr::add_adjacent_zone( "zone_3", "zone_2b", "activate_zone_2b");

	//forest zones
	zm_zonemgr::add_adjacent_zone( "zone_7", "zone_8", "activate_zone_8");

	zm_zonemgr::add_adjacent_zone( "zone_8", "forest_zone1", "activate_forest_zone1");
	zm_zonemgr::add_adjacent_zone( "forest_zone1", "forest_zone2", "activate_forest_zone2");

	//bunker_zone
	zm_zonemgr::add_adjacent_zone( "zone_2b", "bunker_zone", "activate_bunker_zone");

	//final zones
	zm_zonemgr::add_adjacent_zone( "bunker_zone", "final_zone1", "activate_final_zone1");
	zm_zonemgr::add_adjacent_zone( "final_zone1", "final_zone2", "activate_final_zone2");
	zm_zonemgr::add_adjacent_zone( "final_zone2", "final_zone3", "activate_final_zone3");

	zm_zonemgr::add_adjacent_zone( "final_zone2", "bossfight1_zone", "activate_bossfight1_zone");
	zm_zonemgr::add_adjacent_zone( "bossfight1_zone", "bossfight2_zone", "activate_bossfight2_zone");
	zm_zonemgr::add_adjacent_zone( "bossfight2_zone", "bossfight3_zone", "activate_bossfight3_zone");
	zm_zonemgr::add_adjacent_zone( "bossfight3_zone", "bossfight4_zone", "activate_bossfight4_zone");
}	




function custom_add_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_levelcommon_weapons.csv", 1);
}

function soundEasterEggInit()
{
	level.soundEasterEgg = 0;
	level.playEasterEgg = 3;
	level.playSoundLocation = GetEnt("easter_egg_sound_location", "SpookySkeletons"); // Create a script origin and set it to server, not client, then give it this targetname

	thread shoot1();
	thread shoot2();
	thread shoot3();
}

function shoot1()
{
	shoot_trig1 = GetEnt("egg_shoot1", "targetname");
	fazmodel = GetEnt("faz_one", "targetname");
	shoot_trig1 waittill("trigger", player);
	shoot_model1 = GetEnt("shoot_model1", "targetname");
	shoot_model1 delete();
	level.soundEasterEgg++;
	thread finishedEasterEgg();
	shoot_trig1 delete();
	PlayFX("explosions/fx_exp_smk_tendril_sm_os_evb", fazmodel GetOrigin());
	fazmodel PlaySound("bear_shoot");
	fazmodel delete();
}

function shoot2()
{
	shoot_trig2 = GetEnt("egg_shoot2", "targetname");
	fazmodel1 = GetEnt("faz_two", "targetname");
	shoot_trig2 waittill("trigger", player);
	shoot_model2 = GetEnt("shoot_model2", "targetname");
	shoot_model2 delete();
	level.soundEasterEgg++;
	thread finishedEasterEgg();
	shoot_trig2 delete();
	PlayFX("explosions/fx_exp_smk_tendril_sm_os_evb", fazmodel1 GetOrigin());
	self PlaySound("bear_shoot");
	fazmodel1 PlaySound("bear_shoot");
	fazmodel1 delete();
}

function shoot3()
{
	shoot_trig3 = GetEnt("egg_shoot3", "targetname");
	fazmodel2 = GetEnt("faz_three", "targetname");
	shoot_trig3 waittill("trigger", player);
	shoot_model3 = GetEnt("shoot_model3", "targetname");
	shoot_model3 delete();
	level.soundEasterEgg++;
	thread finishedEasterEgg();
	shoot_trig3 delete();
	PlayFX("explosions/fx_exp_smk_tendril_sm_os_evb", fazmodel2 GetOrigin());
	self PlaySound("bear_shoot");
	fazmodel2 PlaySound("bear_shoot");
	fazmodel2 delete();
}

function finishedEasterEgg()
{
	if(level.soundEasterEgg >= level.playEasterEgg)
	{
		IPrintLnBold("You have found all the Bears");
		level.playSoundLocation PlaySound("macarana"); // Change "sephiroth" to the name of your soundalias.

		players = GetPlayers();
		for (i = 0;i<players.size;i++)

		{
		players[i] PlayLocalSound( "macarana");
	}

}
}



function iceGrenade_autoZones()
{
    //One thread below for each trigger
    thread triggerZone("activate_zone_6");
	thread triggerZone("activate_zone_8");
	thread triggerZone("activate_street_zone3");
	thread triggerZone("activate_street_zone5");
	thread triggerZone("activate_street_zone6");
	thread triggerZone("activate_street_zone7");
	thread triggerZone("activate_street_zone8");
	thread triggerZone("activate_zone_2b");
	thread triggerZone("activate_pack_zone");
	thread triggerZone("activate_forest_zone1");
	thread triggerZone("activate_forest_zone2");
	thread triggerZone("activate_bunker_zone");
	thread triggerZone("activate_final_zone1");
	thread triggerZone("activate_final_zone2");
	thread triggerZone("activate_final_zone3");
	thread triggerZone("activate_bossfight1_zone");
	thread triggerZone("activate_bossfight2_zone");
	thread triggerZone("activate_bossfight3_zone");
	thread triggerZone("activate_bossfight4_zone");
}
 
function triggerZone(ztarg)
{
    runit = GetEnt( ztarg, "targetname");
    runit waittill("trigger", player);
    level flag::set( ztarg );
}


//teleporter into Nathans house UPTOWN PAPI
function player_teleporter_init()
{
	trig_tele = GetEnt("teleport_player","targetname");
	trig_tele SetHintString("Hold ^3[{+activate}]^7 To Enter Nathan's House ^2(Safe Zone)");
	player_tp = GetEntArray( "teleport_player", "targetname" );
	for( i = 0; i < player_tp.size; i++ )
	{
		player_tp[i] thread player_teleport();
	}
}

function player_teleport()
{
	destination = GetEnt( self.target, "targetname" );
	while(1)
	{
		self waittill( "trigger", player );
		player SetOrigin( destination.origin );
		player SetPlayerAngles( destination.angles );
		player EnableInvulnerability();
		wait 5;
		player DisableInvulnerability();
	}
}

function player_teleporter_init_one()
{
	trig_tele = GetEnt("teleport_player_one","targetname");
	trig_tele SetHintString("Hold ^3[{+activate}]^7 To Leave Nathan's House");
	player_tp = GetEntArray( "teleport_player_one", "targetname" );
	for( i = 0; i < player_tp.size; i++ )
	{
		player_tp[i] thread player_teleport_one();
	}
}

function player_teleport_one()
{
	destination = GetEnt( self.target, "targetname" );
	while(1)
	{
		self waittill( "trigger", player );
		player SetOrigin( destination.origin );
		player SetPlayerAngles( destination.angles );
		player EnableInvulnerability();
		wait 5;
		player DisableInvulnerability();
	}
}

function player_music()
{
	while(1)
	{
	jukebox = GetEnt("musicsong_one", "targetname");
	jukebox SetHintString("Press ^3[{+activate}]^7 To play song ^4(Macarana)");
	jukebox waittill( "trigger", player);
	level.playSoundLocation PlaySound("song_easter_egg1"); 
	players = GetPlayers();
	for (i = 0;i<players.size;i++)
	players[i] PlayLocalSound( "song_easter_egg1");
	jukebox SetHintString("Press ^3[{+activate}]^7 Twice To play song again ^1 SONGS WILL OVERLAP");
	jukebox waittill("trigger", player);
	}
}

function player_music_one()
{
	while(1)
	{
	jukebox_one = GetEnt("musicsong_two", "targetname");
	jukebox_one SetHintString("Press ^3[{+activate}]^7 To play song ^4(Marty Robbins:Big Iron)");
	jukebox_one waittill( "trigger", player);
	level.playSoundLocation PlaySound("song_easter_egg2"); 
	players = GetPlayers();
	for (i = 0;i<players.size;i++)
	players[i] PlayLocalSound( "song_easter_egg2");
	jukebox_one SetHintString("Press ^3[{+activate}]^7 Twice To play song again ^1 SONGS WILL OVERLAP");
	jukebox_one waittill("trigger", player);
	}
}

function player_music_two()
{
	while(1)
	{
		jukebox_two = GetEnt("musicsong_three", "targetname");
		jukebox_two SetHintString("Press ^3[{+activate}]^7 To play song ^4(The Ink Spots:I Don't Want to Set the World on Fire)");
		jukebox_two waittill( "trigger", player);
		level.playSoundLocation PlaySound("song_easter_egg3"); 
		players = GetPlayers();
		for (i = 0;i<players.size;i++)
		players[i] PlayLocalSound( "song_easter_egg3");
		jukebox_two SetHintString("Press ^3[{+activate}]^7 Twice To play song again ^1 SONGS WILL OVERLAP");
		jukebox_two waittill("trigger", player);
	}
}

function player_music_three()
{
	while(1)
	{
		jukebox_three = GetEnt("musicsong_four", "targetname");
		jukebox_three SetHintString("Press [{+activate}] To play song ^4(Calm and Peaceful)");
		jukebox_three waittill( "trigger", player);
		level.playSoundLocation PlaySound("song_easter_egg4"); 
		players = GetPlayers();
		for (i = 0;i<players.size;i++)
		players[i] PlayLocalSound( "song_easter_egg4");
		jukebox_three SetHintString("Press ^3[{+activate}]^7 Twice To play song again ^1 SONGS WILL OVERLAP");
		jukebox_three waittill("trigger", player);
	}
}

function pack_quest_main(){
	level.pack_count = 0;
	level.pack_complete = 2;
	level.pack_quest_check = 0;


	fx_play1 = GetEnt("fx_play1", "targetname");
	fx_play2 = GetEnt("fx_play2", "targetname");

	fx_play1 Hide();
	fx_play2 Hide();


	real_pack1 = GetEnt("real_pack1", "targetname");
	real_pack1 Hide();

	real_pack2 = GetEnt("real_pack2", "targetname");
	real_pack2 Hide();

	clip1 = GetEnt("pack_clip1", "targetname");
	clip2 = GetEnt("pack_clip2", "targetname");
	clip1 Hide();
	clip2 Hide();



	thread pack_quest1();
	thread pack_quest2();
	thread pack_quest_message();
}

function pack_quest1()
{

	pack_part2 = GetEnt("pack_part2", "targetname");
	pack2_clip = GetEnt("pack2_clip", "targetname");

	pack_part_trig2 = GetEnt("pack_part_trig2", "targetname");

	pack_part_trig2 SetHintString("press ^2[{+activate}]^7 to pick up PACK part");
	pack_part_trig2 SetCursorHint("HINT_NOICON");
	pack_part_trig2 waittill("trigger", player);
	pack_part2 PlaySound("pack_pickup");

	pack2_clip Delete();
	pack_part2 Delete();
	pack_part_trig2 Delete();

	level.pack_count++;
	thread finished_pack_quest();
}

function pack_quest2()
{
	
	pack_part1 = GetEnt("pack_part1", "targetname");

	pack_part_trig1 = GetEnt("pack_part_trig1", "targetname");



	pack_part_trig1 SetHintString("Hold ^2[{+activate}]^7 to pick up PACK part");
	pack_part_trig1 SetCursorHint("HINT_NOICON");
	pack_part_trig1 waittill("trigger", player);
	pack_part1 PlaySound("pack_pickup");


	pack_part1 Delete();
	pack_part_trig1 Delete();

	level.pack_count++;
	thread finished_pack_quest();
}


function finished_pack_quest()
{
	if(level.pack_count >= level.pack_complete)	
	{
		pack_quest_check = 1;
		pack_message = GetEnt("pack_message", "targetname");
		pack_message Delete();
		clip1 = GetEnt("pack_clip1", "targetname");
		clip2 = GetEnt("pack_clip2", "targetname");


		real_pack1 = GetEnt("real_pack1", "targetname");
		real_pack1 Hide();
		real_pack2 = GetEnt("real_pack2", "targetname");
		real_pack2 Hide();
		pack_interact_trig1 = GetEnt("pack_interact_trig1", "targetname");

		pack_interact_trig1 SetHintString("Hold ^3[{+activate}]^7 to place down part");
		pack_interact_trig1 waittill("trigger", player);
		real_pack2 PlaySound("pack_place");

		real_pack1 Show();
		clip1 Show();
		pack_interact_trig1 Delete();


		pack_interact_trig2 = GetEnt("pack_interact_trig2", "targetname");
		pack_interact_trig2 SetHintString("Hold ^2[{+activate}]^7 to place down part");
		pack_interact_trig2 waittill("trigger", player);
		real_pack2 PlaySound("pack_place");

		fx_play1 = GetEnt("fx_play1", "targetname");
		fx_play2 = GetEnt("fx_play2", "targetname");

		fx_play1 Show();
		fx_play2 Show();

		PlayFX("dlc1/castle/fx_elec_jumppad_amb_ext_ring", fx_play1 GetOrigin());
		PlayFX("dlc1/castle/fx_elec_jumppad_amb_ext_ring", fx_play2 GetOrigin());

		real_pack2 Show();
		clip2 Show();

		pack_interact_trig2 PlaySound("pack_charge");

		pack_interact_trig2 Delete();

		pack_teleport_trig = GetEnt("pack_teleport_trig", "targetname");
		thread player_teleporter_init_two();
		


	}

}

function player_teleporter_init_two()
{
	trig_tele = GetEnt("pack_teleport_trig","targetname");
	trig_tele SetHintString("Hold ^2[{+activate}]^7 To teleport to teleport to Pack-a-Punch");
	player_tp = GetEntArray( "pack_teleport_trig", "targetname" );
	for( i = 0; i < player_tp.size; i++ )
	{
		player_tp[i] thread player_teleport_two();
	}
}

function player_teleport_two()
{
	destination = GetEnt( self.target, "targetname" );
	while(1)
	{
		trig_tele = GetEnt("pack_teleport_trig","targetname");
		trig_tele_out = GetEnt("pack_tele_out", "targetname");
		trig_tele_out Hide();
		trig_tele SetHintString("Hold ^3[{+activate}]^7 To teleport to teleport to Pack-a-Punch");
		self waittill( "trigger", player );
		player SetOrigin( destination.origin );
		player SetPlayerAngles( destination.angles );
		trig_tele SetHintString("On Cooldown...");
		thread player_teleporter_init_three();
		wait 60;
	}
}


function player_teleporter_init_three()
{
	wait 35;
	trig_tele_out = GetEnt("pack_tele_out","targetname");
	trig_tele_out Show();
	player_tp = GetEntArray( "pack_tele_out", "targetname" );
	for( i = 0; i < player_tp.size; i++ )
	{
		player_tp[i] thread player_teleport_three();
	}
}

function player_teleport_three()
{
	destination = GetEnt( self.target, "targetname" );
	while(1)
	{
		trig_tele_out = GetEnt("pack_teleport_trig","targetname");
		self waittill( "trigger", player );
		player SetOrigin( destination.origin );
		player SetPlayerAngles( destination.angles );

	}
}

function pack_quest_message()
{
	pack_message = GetEnt("pack_message", "targetname");
	pack_message Show();
	while (level.pack_quest_check == 0)
	{
		pack_message SetHintString("2 PACK Parts Needed...");
		pack_message waittill("trigger", player);
	}

}
function donut_start()
{	
	donut_link_start = GetEnt("donut_link_start", "targetname");
	donut_link_start SetHintString("Hold ^3[{+activate}]^7 To Begin Link Process");
	donut_link_start waittill("trigger", player);
	donut_link_start Delete();

	thread donut_house();
	thread donut_street();

}


function donut_house()
{
	donut_tele_house = GetEnt("donut_tele_house", "targetname");
	donut_tele_house Hide();
	donut_house_message = GetEnt("donut_house_message", "targetname");
	donut_link_house = GetEnt("donut_link_house", "targetname");
	donut_link_house SetHintString("Hold ^3[{+activate}]^7 To Link");
	donut_link_house waittill("trigger", player);
	donut_link_house Delete();
	level.donut_link++;
	if (level.donut_link == 2)
	{
		thread donut_teleport();
	}
	else
	{
		while(level.donut_link < 2)
		{
			donut_house_message SetHintString("Another Link must be Established...");
			donut_house_message waittill("trigger", player);
		}
	}
}

function donut_street()
{
	donut_tele_street = GetEnt("donut_tele_street", "targetname");
	donut_tele_street Hide();
	donut_street_message = GetEnt("donut_street_message", "targetname");
	donut_link_street = GetEnt("donut_link_street", "targetname");
	donut_link_street SetHintString("Hold ^3[{+activate}]^7 To Link");
	donut_link_street waittill("trigger", player);
	donut_link_street Delete();
	level.donut_link++;
	if (level.donut_link == 2)
	{
		thread donut_teleport();
	}
	else
	{
		while(level.donut_link < 2)
		{
			donut_street_message SetHintString("Another Link must be Established...");
			donut_street_message waittill("trigger", player);
		}
	}
}


function donut_teleport()
{
	donut_street_message = GetEnt("donut_street_message", "targetname");
	donut_street_message Delete();
	donut_house_message = GetEnt("donut_house_message", "targetname");
	donut_house_message Delete();

	thread donut_teleport_house();
	thread donut_teleport_street();
}

function donut_teleport_house()
{
	donut_tele_house = GetEnt("donut_tele_house", "targetname");
	donut_tele_house Show();
	donut_tele_house SetHintString("Hold ^3[{+activate}]^7 to Teleport to Spawn ^3(1500 Points)");
	player_tp = GetEntArray( "donut_tele_house", "targetname" );
	for( i = 0; i < player_tp.size; i++ )
	{
			player_tp[i] thread player_teleport_house();
	}
}


function player_teleport_house()
{
	donut_tele_house = GetEnt("donut_tele_house", "targetname");
	destination = GetEnt( self.target, "targetname" );
	while(1)
	{
		self waittill( "trigger", player );
		if(player.score >= level.teleport_cost)
		{
			player zm_score::minus_to_player_score(level.teleport_cost);
			player SetOrigin( destination.origin );
			player SetPlayerAngles( destination.angles );
			donut_tele_house SetHintString("On Cooldown...");
			player EnableInvulnerability();
			wait 5;
			player DisableInvulnerability();
			donut_tele_house SetHintString("Hold ^3[{+activate}]^7 To Teleport ^3(1500 Points)");
		}
	}

}

function donut_teleport_street()
{
	donut_tele_street = GetEnt("donut_tele_street", "targetname");
	donut_tele_street Show();
	donut_tele_street SetHintString("Hold ^3[{+activate}]^7 to Teleport to Spawn ^3(1500 Points)");
	player_tp = GetEntArray( "donut_tele_street", "targetname" );
	for( i = 0; i < player_tp.size; i++ )
	{
			player_tp[i] thread player_teleport_street();
	}
}

function player_teleport_street()
{
	donut_tele_street = GetEnt("donut_tele_street", "targetname");
	destination = GetEnt( self.target, "targetname" );
	while(1)
	{
		self waittill( "trigger", player );
		if(player.score >= level.teleport_cost)
		{
			player zm_score::minus_to_player_score(level.teleport_cost);
			player SetOrigin( destination.origin );
			player SetPlayerAngles( destination.angles );
			donut_tele_street SetHintString("On Cooldown...");
			player EnableInvulnerability();
			wait 5;
			player DisableInvulnerability();
			donut_tele_street SetHintString("Hold ^3[{+activate}]^7 To Teleport ^3(1500 Points)");
		}
	}

}






