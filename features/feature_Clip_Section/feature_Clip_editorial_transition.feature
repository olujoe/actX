#####################################################################################################################################################
##### This is the feature file for Clip editorial test cases#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
#####################################################################################################################################################
########## Clip Editorial - Transistion ############
### Before running the test, please check if the clip from the Environment -
### Check in Clip_config.rb for title name and check if thye are availble on ENPS
### If you are making a change, please make sure to change the images as well.
########################################################################

########################################################################
@Clip_editorial_transition
Feature: Clip_editorial_transition

Background:
	Given I go to ENPS
	And I start "West1"
	And I open "CLIP" tab
	And I search "clipname1"
	And I can view all result
	And I view clip detail


@Set_Transition_for_clip_object_cut  @C653385
Scenario: Set_Transition_for_clip_object_CUT
	Given timecode is set to "hms"
	And I open "CLIP" tab
	When I set clip transition to "CUT"
	Then I copy object
	And I check mos clip object xml:
	|field				|subfield			|value					|
	|mosID				|					|BIGTED.W1.BBC.MOS		|
	|objType			|					|VIDEO					|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b 					|CLIP:	|
	|objDur				|					|7179					|
	|transition			|					|CUT					|
	And I go back to search


@Set_Transition_for_clip_object_mix  @C668821
Scenario: Set_Transition_for_clip_object_MIX
	Given timecode is set to "hms"
	And I open "CLIP" tab
	When I set clip transition to "MIX"
	Then I copy object
	And I check mos clip object xml:
	|field				|subfield			|value					|
	|mosID				|					|BIGTED.W1.BBC.MOS		|
	|objType			|					|VIDEO					|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b 					|CLIP:	|
	|objDur				|					|7179					|
	|transition			|					|MIX					|
	And I go back to search

@Set_Transition_for_clip_object_wipe1  @C668822
Scenario: Set_Transition_for_clip_object_WIPE1
	Given timecode is set to "hms"
	And I open "CLIP" tab
	When I set clip transition to "WIPE1"
	Then I copy object
	And I check mos clip object xml:
	|field				|subfield			|value					|
	|mosID				|					|BIGTED.W1.BBC.MOS		|
	|objType			|					|VIDEO					|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b 					|CLIP:	|
	|objDur				|					|7179					|
	|transition			|					|WIPE1					|
	And I go back to search

@Set_Transition_for_clip_object_wipe2  @C668823
Scenario: Set_Transition_for_clip_object_WIPE2
	Given timecode is set to "hms"
	And I open "CLIP" tab
	When I set clip transition to "WIPE2"
	Then I copy object
	And I check mos clip object xml:
	|field				|subfield			|value					|
	|mosID				|					|BIGTED.W1.BBC.MOS		|
	|objType			|					|VIDEO					|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b 					|CLIP:	|
	|objDur				|					|7179					|
	|transition			|					|WIPE2					|
	And I go back to search

@Set_Transition_for_clip_object_itx  @C668824
Scenario: Set_Transition_for_clip_object_itx
	Given timecode is set to "hms"
	And I open "CLIP" tab
	When I set clip transition to "iTX DEFAULT"
	Then I copy object
	And I check mos clip object xml:
	|field				|subfield			|value					|
	|mosID				|					|BIGTED.W1.BBC.MOS		|
	|objType			|					|VIDEO					|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b 					|CLIP:	|
	|objDur				|					|7179					|
	|transition			|					|iTX DEFAULT			|
	And I use Alt F4

########################################################################
#Scenario:Close BigTed ActiveX
#	And I close BigTed Active X
