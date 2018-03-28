#####################################################################################################################################################
##### This is feature file for CG and ENPS integration feature test cases#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
#####################################################################################################################################################

@Mosart_Integration
Feature: Mosart_ENPS_Integration
#Background: As a user, I wan to open BigTed Active X and select tab Mosart.


@Insert_Mosart_Object_to_ENPS @C653396
Scenario: User select Set LDN, Template SOUND and Variant 1 - 002 FADE PREVIEW TEST, set Occurs at to Absolute time of day and enter 25:00:00
	Given I go to ENPS
	And I start "West1"
	And site "West1" is opened
	And timecode is set to "hms"
	And I open "MOSART" tab
	And I select Set "LDN" and Template "SOUND"
	And I select variant "0"
	When I select occurs at "Absolute time of day"
	And I set "Absolute time of day" as "25:00:00"
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |LDN      |
	|objSlug        |         	  |MOSART SOUND - 002 FADE PREVIEW TEST|
	|mosAbstract    |b  		  |MOSART SOUND - 002 FADE PREVIEW TEST|
	|objTB          |             |25                            |
	|type		    |			  |SOUND		|
	|variant	    |			  |002 FADE PREVIEW TEST		|
	|field          |             |@23:59:59             |
	And I paste object in ENPS
	And I check in ENPS to verify "MOSART" object
	And I wait "2" seconds

@View_Mosart_Object_from_ENPS @Cancel_Mosart_Object_edit_from_ENPS @C653395
Scenario: View_and_Cancel_edit_Mosart_Object_from_ENPS
	Given a "MOSART" object exists in a running order
	When I view "MOSART" object
	And I cancel edit
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |LDN      |
	|objSlug        |         	  |MOSART SOUND - 002 FADE PREVIEW TEST|
	|mosAbstract    |b  		  |MOSART SOUND - 002 FADE PREVIEW TEST|
	|objTB          |             |25                            |
	|type		    |			  |SOUND		|
	|variant	    |			  |002 FADE PREVIEW TEST		|
	|field          |             |@23:59:59             |
	And I use Alt F4

@Edit_Mosart_Object_from_ENPS @C668999
Scenario: View_and_Cancel_edit_Mosart_Object_from_ENPS
	Given a "MOSART" object exists in a running order
	And I view "MOSART" object
	When I select occurs at "Relative to start"
	And I set "Relative to start" as "00:02:36"
	And I set mosart transition "WIPE"
	And I set "373" frames
	And I save edit
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |LDN      |
	|objSlug        |         	  |MOSART SOUND - 002 FADE PREVIEW TEST|
	|mosAbstract    |b  		  |MOSART SOUND - 002 FADE PREVIEW TEST|
	|objMode		|			  |InTime |
	|objStart		|			  |3900 |
	|objTB          |             |25                            |
	|type		    |			  |SOUND		|
	|variant	    |			  |002 FADE PREVIEW TEST		|
	|transition		|			  |WIPE		|
	|field          |             |3             |
	|field1         |            |3900             |
	And I use Alt F4
	And I close BigTed Active X
	And I use RETURN
	And I use Right
	And I use RETURN
