#####################################################################################################################################################
##### This is the feature file for Clip ENPS integration test cases#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
#####################################################################################################################################################
#################################################################################################
### Please make sure you check the clip you are using for the test.
### If you are changing clip, you will need to replace the expected value in the xml
### fields, this also applies to site changes.
### For instances: mosID, objSlug, mosAbstract, objDur, itemTiming, itemEdDur, itemUserTimingDur
#################################################################################################


@Clip_integration
Feature: Clip_integration

@Insert_Clip_Object_to_ENPS @Smoke @Sanity @C659622
Scenario: Insert_Clip_Object_to_ENPS
	Given I go to ENPS
	And I start "West1"
	And I open "CLIP" tab
	And I search "clipname1"
	And I can view all result
	And I view clip detail
	And timecode is set to "hms"
	And I open "CLIP" tab
	And I set clip transition to "MIX"
	And I mark editorial duration via "manualtimecode"
	And I check editorial duration timecode "manualtimecode"
	And I set "in" word
	And I set "out" word
	And I copy object
	And I check mos clip object xml:
	|field				|subfield			|value					|
	|mosID				|					|BIGTED.W1.BBC.MOS		|
	|objType			|					|VIDEO					|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b 					|CLIP:	|
	|objDur				|					|7179					|
	|itemTiming			|					|1825					|
	|itemEdDur			|					|1825					|
	|itemUserTimingDur	|					|1825					|
	|objTB          |             |25                            |
	|inWords			|					|in word & test		|
	|outWords			|					|out word & test	|
	|transition			|					|MIX					|

	When I paste object in ENPS
	Then I check in ENPS to verify "CLIP" object


@View_Clip_Object_from_ENPS @Cancel_Clip_Object_edit_from_ENPS @Smoke @Sanity @C653386
Scenario: View_and_Cancel_edit_Clip_Object_from_ENPS
	Given a "CLIP" object exists in a running order
	When I view "CLIP" object
	And I cancel edit
	And I copy object
	Then I check mos clip object xml:
	|field				|subfield			|value					|
	|mosID				|					|BIGTED.W1.BBC.MOS		|
	|objType			|					|VIDEO					|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|mosAbstract		|b 					|CLIP:	|
	|objDur				|					|7179					|
	|itemTiming			|					|1825					|
	|itemEdDur			|					|1825					|
	|itemUserTimingDur	|					|1825					|
	|objTB          |             |25                            |
	|inWords			|					|in word & test		|
	|outWords			|					|out word & test	|
	|transition			|					|MIX					|
	And I use Alt F4


@Edit_Clip_Object_from_ENPS @Smoke @Sanity @C668820
Scenario: Edit_Clip_Object_from_ENPS
	Given a "CLIP" object exists in a running order
	When I view "CLIP" object
	And timecode is set to "hmsf"
	And I open "CLIP" tab
	And I mark editorial duration via "manualtimecodeframe"
	And I check editorial duration timecode "manualtimecodeframe"
	And I set clip transition to "CUT"
	And I save edit
	And I copy object
	Then I check mos clip object xml:
	|field				|subfield			|value					|
	|mosID				|					|BIGTED.W1.BBC.MOS		|
	|objType			|					|VIDEO					|
	|objSlug			|					|OBIT/CHARLESCONTROV/1311/3/6	|
	|objDur				|					|7179					|
	|itemTiming			|					|1213					|
	|itemEdDur			|					|1213					|
	|itemUserTimingDur	|					|1213					|
	|objTB          |             |25                            |
	|inWords			|					|in word  test 			|
	|outWords			|					|out word  test 		|
	|transition			|					|CUT					|
	And I close all scripts
	And I close BigTed Active X


#@smoketest
#Scenario: Testest
#Given a "clip" object exists in a running order

#Scenario:Close BigTed ActiveX
#	And I close BigTed Active X
