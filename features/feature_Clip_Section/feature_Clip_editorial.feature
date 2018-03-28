#####################################################################################################################################################
##### This is the feature file for Clip editorial test cases#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
#####################################################################################################################################################
########## Clip Editorial ############
### Before running the test, please check if the clip from the Environment -
### Check in Clip_config.rb for title name and check if thye are availble on ENPS
### If you are making a change, please make sure to change the images as well.
########################################################################


@Clip_editorial
Feature: Clip_editorial

Background:
	Given I go to ENPS
	And I start "West1"
	And I open "CLIP" tab
	And I search "clipname1"
	And I can view all result
	And I view clip detail



@Mark_Timecode_CG_via_In_Out_button @C653380
Scenario: Mark_Timecode_CG_via_In_Out_button
	Given timecode is set to "hms"
	And CG set to home style
	And I open "CLIP" tab
	When I mark in out via "cgbutton"
	Then I check CG in out timecode "cgbutton"


@Mark_Timecode_CG_via_Input_Timecode @C653381
Scenario: Mark_Timecode_CG_via_Input_Timecode
	Given timecode is set to "hms"
	And CG set to home style
	And I open "CLIP" tab
	When I mark in out via "manualtimecode"
	Then I check CG in out timecode "manualtimecode"


@Mark_Timecode_CG_via_In_Out_button_frames @C668825
Scenario: Mark_Timecode_CG_via_In_Out_button_frames
	Given timecode is set to "hmsf"
	And CG set to home style
	And I open "CLIP" tab
	When I mark in out via "cgbuttonframe"
	Then I check CG in out timecode "cgbuttonframe"


@Mark_Timecode_CG_via_Input_Timecode_frames @C668826
Scenario: Mark_Timecode_CG_via_Input_Timecode_frames
	Given timecode is set to "hmsf"
	And CG set to home style
	And I open "CLIP" tab
	When I mark in out via "manualtimecodeframe"
	Then I check CG in out timecode "manualtimecodeframe"

########################################################################
### Please make sure you check the clip you are using for the test.
### If you are changing clip, you will need to replace the expected value in the xml
### fields, this also applies to site changes.
### For instances: mosID, objSlug, mosAbstract, objDur
########################################################################

@Set_Editorial_Duration_via_Editorial_button @C653382
Scenario: Set_Editorial_Duration_via_Editorial_button
	Given timecode is set to "hms"
	And I open "CLIP" tab
	When I mark editorial duration via "edbutton"
	Then I check editorial duration timecode "edbutton"
	Then I copy object
	And I check mos clip object xml:
	|field				|subfield			|value						|
	|mosID				|					|BIGTED.W1.BBC.MOS			|
	|objType			|					|VIDEO						|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b					|CLIP:	|
	|objDur				|					|7179				|
	|itemEdDur			|					|575				|
	|itemUserTimingDur	|					|575				|
	|objTB          |             |25                            |
	And I go back to search


@Set_Editorial_Duration_via_Input_Timecode @C653383
Scenario: Set_Editorial_Duration_via_Input_Timecode
	Given timecode is set to "hms"
	And I open "CLIP" tab
	When I mark editorial duration via "manualtimecode"
	Then I check editorial duration timecode "manualtimecode"
	Then I copy object
	And I check mos clip object xml:
	|field				|subfield			|value						|
	|mosID				|					|BIGTED.W1.BBC.MOS			|
	|objType			|					|VIDEO						|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b 					|CLIP:	|
	|objDur				|					|7179				|
	|itemTiming			|					|1825				|
	|itemEdDur			|					|1825				|
	|itemUserTimingDur	|					|1825				|
	|objTB          |             |25                            |
	And I go back to search


@Set_Editorial_Duration_via_Editorial_button_frames @C668827
Scenario: Set_Editorial_Duration_via_Editorial_button
	Given timecode is set to "hmsf"
	And I open "CLIP" tab
	When I mark editorial duration via "edbuttonframe"
	Then I check editorial duration timecode "edbuttonframe"
	Then I copy object
	And I check mos clip object xml:
	|field				|subfield			|value						|
	|mosID				|					|BIGTED.W1.BBC.MOS			|
	|objType			|					|VIDEO						|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b 					|CLIP:	|
	|objDur				|					|7179				|
	|itemTiming			|					|982			|
	|itemEdDur			|					|982				|
	|itemUserTimingDur	|					|982				|
	|objTB          |             |25                            |
	And I go back to search


@Set_Editorial_Duration_via_Input_Timecode_frames @C668828
Scenario: Set_Editorial_Duration_via_Input_Timecode
	Given timecode is set to "hmsf"
	And I open "CLIP" tab
	When I mark editorial duration via "manualtimecodeframe"
	Then I check editorial duration timecode "manualtimecodeframe"
	Then I copy object
	And I check mos clip object xml:
	|field				|subfield			|value						|
	|mosID				|					|BIGTED.W1.BBC.MOS			|
	|objType			|					|VIDEO						|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b 					|CLIP:	|
	|objDur				|					|7179				|
	|itemTiming			|					|1213				|
	|itemEdDur			|					|1213				|
	|itemUserTimingDur	|					|1213				|
	|objTB          |             |25                            |
	And I go back to search



@Set_in_out_word_for_clip_object  @C656280
Scenario: Set_in_out_word_for_clip_object
	Given timecode is set to "hms"
	And I open "CLIP" tab
	When I set "in" word
	And I set "out" word
	Then I copy object
	And I check mos clip object xml:
	|field				|subfield			|value						|
	|mosID				|					|BIGTED.W1.BBC.MOS			|
	|objType			|					|VIDEO						|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6		|
	|mosAbstract		|b 					|CLIP:		|
	|objDur				|					|7179						|
	|inWords			|					|in word & test			|
	|outWords			|					|out word & test			|
	And I use Alt F4

########################################################################
#Scenario:Close BigTed ActiveX
#	And I close BigTed Active X
