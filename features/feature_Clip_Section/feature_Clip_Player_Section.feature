#####################################################################################################################################################
##### This is the Featire file for Clip Player control test cases#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
#####################################################################################################################################################



########## Clip Player controls  ############

@Clip_player_controls
Feature: Clip_player_controls

@Clip_Player_Load_Clip @C653373
Scenario: Load_Clip
	Given I go to ENPS
	And I start "West1"
	And I open "CLIP" tab
	And I search "clipname2"
	When I can view all result
	Then I view clip detail

@Clip_Player_Play @C653374
Scenario: Clip_player_play
	When I start playback "clipname2"
	Then clip "clipname2" plays


@Clip_Player_Pause @C653375
Scenario: Clip_player_pause
	When I pause playback
	Then clip stops

@Clip_Player_Timeline_navigation @C653376
Scenario: Clip_Player_Timeline_navigation
	When I scrub "forward" on "clipname2"
	Then clip plays from selected segment
	And I scrub "backward" on "clipname2"

@Clip_Player_Mute @C653377
Scenario: Clip_player_mute
	When I mute audio
	Then audio is muted


@Clip_Player_Unmute @C653378
Scenario: Clip_player_unmute
	When I unmute audio
	Then audio is unmute

	And I use Alt F4

#Scenario:Close BigTed ActiveX
#	And I close BigTed Active X
