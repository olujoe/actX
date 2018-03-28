#####################################################################################################################################################
##### This is feature file for CG define Caption feature test cases#####
##### Author: Brian Tsang
#####################################################################################################################################################

@CG_define_caption_more
Feature: CG_define_caption_more
Background: As a user, I wan to open BigTed Active X and select tab CG.So I can create/edit CG item to insert into running order in ENPS.
	Given I go to ENPS
	And I start "West1"
	And I open "CG" tab

@Utilize_CG_Database_entries @C653345
Scenario: Select a CG style (NEWS), CG Code name, Select a name from the list via Select Name from Database, insert a name by double click or clicking Use Selected Entry
	Given I select Style "NEWS" and CG code "NAME"
	When I Select Name from Database
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value        |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG        |
	|objArea      |         	|West 1       |
	|objStyle     |         	|NEWS       |
	|objTrigger   |         	|MANUAL       |
	#|objSlug      |         	|CG: NAME  \\THERESA MAY MP \\Prime Minister|
	|mosAbstract  |b  			|CG: NAME  \\THERESA MAY MP \\Prime Minister|
	|abstract  	  |b  			|CG: NAME  \\THERESA MAY MP \\Prime Minister|
	|field0		  |				|THERESA MAY MP|
	|field1		  |				|Prime Minister		|
	|field5		  |				|DSK			|
	|field6		  |				|MANUAL			|
	Then I paste object in ENPS
	And I check in ENPS to verify "CG" object
	And I use Alt F4
	And I use Alt F4
	And I use RETURN
	And I use RETURN
	And I use RETURN

@Clear_CG_Caption_Text @C653341
Scenario: As a user, I want to clear text input via the clear button. So that I can clear text field, re-enter metadata.
	Given timecode is set to "hmsf"
	And I open "CG" tab
	And I select Style "OTHERS" and CG code "NEWSWATCH STRAP"
	And I input text in field "Name" in "NONE" case
	And I input text in field "Designation" in "NONE" case
	When I set CG timming to "AUTO K/W STORY"
	And I set "In Time" as "10:61:60:26"
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value      |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG         |
	|objArea      |         	|West 1     |
	|objStyle     |         	|OTHERS     |
	|objTrigger   |         	|AUTO       |
	#|objSlug      |         	|CG: NEWSWATCH STRAP  \\test NAME " \\test DESIGNATION AUTO: IN AT: 11:02'01 (KEEP WHILE STORY)|
	|objMode	  |				|3			|
   	|objParams	  |				|NEWSWATCH STRAP  \\test NAME " \\test DESIGNATION|
    |objStart	  |				|993026		|
    |objDur		  |				|0			|
	|field0		  |				|test NAME	|
	|field1		  |				|test DESIGNATION|
	|field2		  |				|DSK		|
	|field3		  |				|AUTO		|
	|field4		  |				|993026		|
	Then I clear CG form
	And I check CG form is cleared
	And I select Style "NEWS" and CG code "CREDIT DATE"
	And I input text in field "Picture Credit 1" in "NONE" case
	And I select "Picture Credit 2" dropdown with "ITV sport"
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value      |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG         |
	|objArea      |         	|West 1     |
	|objStyle     |         	|NEWS     |
	#|objTrigger   |         	|AUTO       |
	|objTrigger   |         	|MANUAL       |
	#|objSlug      |         	|CG: CREDIT DATE  \\This is a test to check combo box text input clear!! \\ITV Sport|
	|objMode	  |				|0			|
   	|objParams	  |				|CREDIT DATE  \\This is a test to check combo box text input clear!! \\ITV Sport|
    |objStart	  |				|0			|
    |objDur		  |				|0			|
	|field0		  |				|This is a test to check combo box text input clear!!|
	|field1		  |				|ITV Sport|
	|field2		  |				|DSK		|
	|field3		  |				|MANUAL		|
	#|field3		  |				|AUTO		|
	Then I clear CG form
	And I check CG form is cleared

@Define_Caption_Text_Cases_Accent @C653344
Scenario: Select a CG style (NEWS) and select CG Code which offers User's Text input, insert Accents or Symbols via Accents, etc. pane
	Given I select Style "NEWS" and CG code "LOCATOR LEFT"
	When I input accents in field "Location" in "UPPER" case
	And I input accents in field "Timeoffset" in "LOWER" case
	And I input accents in field "Freetext" in "DEGREES" case
	And I input accents in field "Freetext" in "EURO" case
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value      |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG         |
	|objArea      |         	|West 1     |
	|objStyle     |         	|NEWS     |
	|objTrigger   |         	|MANUAL       |
	#|objTrigger   |         	|AUTO       |
	#|objSlug      |         	|CG: LOCATOR LEFT  \\ \\ÀÁÄÂÅÃĂÆÈÉËÊĚÌÍÏÎÒÓÖÔÕŐØŒÙÚÜÛŰÝŸĆÇČŚŞŠßŃÑŇŴ \\àáäâåãăæèéëêěìíïîòóöôõőøœùúüûűýÿćçčśşšßńñňŵ \\°€ \\Default|
	|objMode	  |				|0			|
	#|objParams	  |				|LOCATOR LEFT  \\ \\ÀÁÄÂÅÃĂÆÈÉËÊĚÌÍÏÎÒÓÖÔÕŐØŒÙÚÜÛŰÝŸĆÇČŚŞŠßŃÑŇŴ \\àáäâåãăæèéëêěìíïîòóöôõőøœùúüûűýÿćçčśşšßńñňŵ \\°€ \\Default|
	|objParams	  |				|LOCATOR LEFT  \\ \\ÀÁÄÂÅÃĂÆÈÉËÊĚÌÍÏÎÒÓÖÔÕŐØŒÙÚÜÛŰÝŸĆÇČŚŞŠßŃÑŇŴ \\àáäâåãăæèéëêěìíïîòóöôõőøœùúüûűýÿćçčśşšßńñňŵ \\°€ \\|
    |objStart	  |				|0			|
    |objDur		  |				|0			|
	#|field3		  |				|Default	|
	|field3		  |				|	|
	|field4		  |				|DSK		|
	|field5		  |				|MANUAL		|
	#|field5		  |				|Auto		|
	Then I paste object in ENPS
	And I check in ENPS to verify "CG" object
	And I use Alt F4
	And I use Alt F4
	And I use RETURN
	And I use RETURN
	And I use RETURN
