#####################################################################################################################################################
##### This is feature file for CG and ENPS integration feature test cases#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
#####################################################################################################################################################

@CG_Integration
Feature: CG_ENPS_Integration
#Background:


@Insert_CG_Object_to_ENPS @C653348
Scenario: User set Automatic NO OUT timing parameter via timecode input on Style NEWS, CG LOGO ON, insert into ENPS running order
	When I go to ENPS
	Then I start "West1"
	And I open "CG" tab
	Given timecode is set to "hms"
	And I open "CG" tab
	And I select Style "POLITICS" and CG code "CRAWL"
	And I input text in field "Ticker Content" in "NONE" case
	When I set CG timming to "AUTO NO OUT"
	And I set "In Time" as "10:03:29"
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value      |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG         |
	|objArea      |         	|West 1     |
	|objStyle     |         	|POLITICS   |
	|objTrigger   |         	|AUTO       |
	#|objSlug      |         	|CG: CRAWL  \\This ' is a test for TICKER Content!!AUTO: IN AT: 10:03'29 (NO AUTO OUT)  |
	|objMode	  |				|4			|
   	|objParams	  |				|CRAWL  \\This ' is a test for TICKER Content!!|
    |objStart	  |				|905225		|
    |objDur		  |				|0			|
	|field0		  |				|This ' is a test for TICKER Content!!|
	|field1		  |				|DSK		|
	|field2		  |				|AUTO		|
	|field3		  |				|905225	|
	And I paste object in ENPS
	And I check in ENPS to verify "CG integration" object



@View_CG_Object_from_ENPS @Cancel_CG_Object_edit_from_ENPS @C661933
Scenario: View_and_Cancel_edit_CG_Object_from_ENPS
	Given a "CG integration" object exists in a running order
	When I view "CG integration" object
	And I cancel edit
	And I copy object
	Then I check mos CG object xml:
	|field        |subfield     |value      |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG         |
	|objArea      |         	|West 1     |
	|objStyle     |         	|POLITICS   |
	|objTrigger   |         	|AUTO       |
	#|objSlug      |         	|CG: CRAWL  \\This ' is a test for TICKER Content!!AUTO: IN AT: 10:03'29 (NO AUTO OUT)|
	|objMode	  |				|4			|
   	|objParams	  |				|CRAWL  \\This ' is a test for TICKER Content!!|
    |objStart	  |				|905225		|
    |objDur		  |				|0			|
	|field0		  |				|This ' is a test for TICKER Content!!|
	|field1		  |				|DSK		|
	|field2		  |				|AUTO		|
	|field3		  |				|905225	|
	#And I close BigTed Active X
	And I use Alt F4
	And I click on "white_space_enps_new.png"


@Edit_CG_Object_from_ENPS @C653347
Scenario: Edit_CG_Object_from_ENPS
	Given a "CG integration" object exists in a running order
	When I view "CG integration" object
	And timecode is set to "hmsf"
	And I open "CG" tab
	And I input text in field "Ticker Content Edit" in "UPPER" case
	And I save edit
	And I copy object
	Then I check mos CG object xml:
	|field        |subfield     |value      |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG         |
	|objArea      |         	|West 1     |
	|objStyle     |         	|POLITICS   |
	#|objTrigger   |         	|MANUAL       |
	|objTrigger   |         	|AUTO       |
	#|objSlug      |         	|CG: CRAWL  \\THIS IS AN EDIT CG OBJECT TEST FOR TICKER CONTENT!!|
	|mosAbstract  |b			|CG: CRAWL  \\THIS IS AN EDIT CG OBJECT TEST FOR TICKER CONTENT!!|
	|abstract  	  |b			|CG: CRAWL  \\THIS IS AN EDIT CG OBJECT TEST FOR TICKER CONTENT!!|
	#|objMode	  |				|0			|
	|objMode	  |				|4			|
   	|objParams	  |				|CRAWL  \\THIS IS AN EDIT CG OBJECT TEST FOR TICKER CONTENT!!|
    |objStart	  |				|0		|
    |objDur		  |				|0		|
    |field0		  |				|THIS IS AN EDIT CG OBJECT TEST FOR TICKER CONTENT!!|
    |field1		  |				|DSK		|
	#|field2		  |				|MANUAL		|
	|field2		  |				|AUTO		|
	And I close BigTed Active X
	And I use Alt F4
	And I use Alt F4
	And I use RETURN
	And I use RETURN
	And I use RETURN
