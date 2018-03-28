#####################################################################################################################################################
##### This is feature file for CG define Caption feature test cases#####
##### Author: Brian Tsang
#####################################################################################################################################################

@CG_define_caption
Feature: CG_define_caption
Background: As a user, I want to open BigTed Active X and select tab CG.So I can create/edit CG item to insert into running order in ENPS.
	Given I go to ENPS
	And I start "West1"
	And I open "CG" tab



@Define_Caption_Text_Cases_Upper @C653342
Scenario: Select a CG style (NEWS) and select CG Code which offers User's Text input, Input some text and set Text case to Upper case, using Upper button
	Given I select Style "NEWS" and CG code "LOCATOR LEFT"
	When I input text in field "Location" in "UPPER" case
	And I input text in field "Timeoffset" in "UPPER" case
	And I input text in field "Freetext" in "UPPER" case
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value        |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG        |
	|objArea      |         	|West 1       |
	|objStyle     |         	|NEWS       |
	|objTrigger   |         	|MANUAL       |
	#|objSlug      |         	|CG: LOCATOR LEFT  \\ \\TEST LOCATION & CASE \\TEST TIME OFFSET \\TEST CG FREETEXT \\Default|
	#|objSlug      |         	|CG: LOCATOR LEFT  \\ \\TEST LOCATION & CASE \\TEST TIME OFFSET \\TEST CG FREETEXT \\|
	#|mosAbstract  |b  			|CG: LOCATOR LEFT  \\ \\TEST LOCATION & CASE \\TEST TIME OFFSET \\TEST CG FREETEXT \\Default|
	|mosAbstract  |b  			|CG: LOCATOR LEFT  \\ \\TEST LOCATION & CASE \\TEST TIME OFFSET \\TEST CG FREETEXT \\|
	#|abstract  	  |b  			|CG: LOCATOR LEFT  \\ \\TEST LOCATION & CASE \\TEST TIME OFFSET \\TEST CG FREETEXT \\Default|
	|abstract  	  |b  			|CG: LOCATOR LEFT  \\ \\TEST LOCATION & CASE \\TEST TIME OFFSET \\TEST CG FREETEXT \\|
	|field1		  |				|TEST LOCATION &amp; CASE				|
	|field2		  |				|TEST TIME OFFSET		|
	|field3		  |				|TEST CG FREETEXT				|
	#|field4		  |				|Default			|
	|field5		  |				|DSK			|
	|field6		  |				|MANUAL			|
	Then I paste object in ENPS
	#And I check in ENPS to verify "CG" object
	And I close BigTed Active X



@Define_Caption_Text_Cases_Lower @C661935
Scenario: Select a CG style (NEWSNIGHT) and select CG Code which offers User's Text input, Input some text and set Text case to Lower case, using Lower button
Given I select Style "NEWSNIGHT" and CG code "NN LOCATOR"
	When I input text in field "Location" in "LOWER" case
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value        |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG        |
	|objArea      |         	|West 1       |
	|objStyle     |         	|NEWSNIGHT       |
	|objTrigger   |         	|MANUAL       |
	#|objSlug      |         	|CG: NN LOCATOR  \\ \\test location & case|
	|mosAbstract  |b  			|CG: NN LOCATOR  \\ \\test location & case|
	|abstract     |b  			|CG: NN LOCATOR  \\ \\test location & case|
	|field1		  |				|test location &amp; case|
	|field5		  |				|DSK			|
	|field6		  |				|MANUAL			|
	Then I paste object in ENPS
	#And I check in ENPS to verify "CG" object
	And I close BigTed Active X
	And I use Alt F4
	And I use Alt F4
	And I use RETURN
	And I use RETURN
	And I use RETURN


@Define_Caption_Text_Cases_Title @C661936
Scenario: Select a CG style (POLITICS) and select CG Code which offers User's Text input, Input some text and set Text case to Title case, using Title button
Given I select Style "POLITICS" and CG code "COMING UP"
	When I input text in field "Tabtext" in "TITLE" case
	And I input text in field "Straptext" in "TITLE" case
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value        |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG        |
	|objArea      |         	|West 1       |
	|objStyle     |         	|POLITICS       |
	|objTrigger   |         	|MANUAL       |
	#|objSlug      |         	|CG: COMING UP  \\Test Cg Tabtext \\Test Cg Straptext|
	|mosAbstract  |b  			|CG: COMING UP  \\Test Cg Tabtext \\Test Cg Straptext|
	|abstract  	  |b  			|CG: COMING UP  \\Test Cg Tabtext \\Test Cg Straptext|
	|field0		  |				|Test Cg Tabtext		|
	|field1		  |				|Test Cg Straptext		|
	|field5		  |				|DSK			|
	|field6		  |				|MANUAL			|
	Then I paste object in ENPS
	And I check in ENPS to verify "CG" object
	And I close BigTed Active X




@Define_Caption_Text_Cases_Abbr_Undo @C653343
Scenario: In CG Tab, select a style with Name, Story strap etc CG code, input text Labour/Conservative , press Abbr. Button and use Undo button to revert back to the original

	Given I select Style "NEWS" and CG code "NAME"
	And I input text in field "Name" in "UPPER" case
	And I input text in field "Designation Abbr" in "UPPER" case
	And I check for abbreviation "2"
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value        |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG        |
	|objArea      |         	|West 1       |
	|objStyle     |         	|NEWS       |
	|objTrigger   |         	|MANUAL       |
	#|objSlug      |         	|CG: NAME  \\TEST NAME " \\Lab, < > Con|
	|mosAbstract  |b  			|CG: NAME  \\TEST NAME " \\Lab, < > Con|
	|abstract  	  |b  			|CG: NAME  \\TEST NAME " \\Lab, < > Con|
	|field0		  |				|TEST NAME &quot;				|
	|field1		  |				|Lab, &lt; &gt; Con	|
	|field5		  |				|DSK				|
	|field6		  |				|MANUAL				|
	When I undo abbreviation
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value        |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG        |
	|objArea      |         	|West 1       |
	|objStyle     |         	|NEWS       |
	|objTrigger   |         	|MANUAL       |
	#|objSlug      |         	|CG: NAME  \\TEST NAME " \\LABOUR, < > Con|
	|mosAbstract  |b  			|CG: NAME  \\TEST NAME " \\LABOUR, < > Con|
	|abstract  	  |b  			|CG: NAME  \\TEST NAME " \\LABOUR, < > Con|
	|field0		  |				|TEST NAME &quot;				|
	|field1		  |				|LABOUR, &lt; &gt; Con	|
	|field5		  |				|DSK			|
	|field6		  |				|MANUAL			|
	Then I undo abbreviation
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value        |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG        |
	|objArea      |         	|West 1       |
	|objStyle     |         	|NEWS       |
	|objTrigger   |         	|MANUAL       |
	#|objSlug      |         	|CG: NAME  \\TEST NAME " \\LABOUR, < > CONSERVATIVE|
	|mosAbstract  |b  			|CG: NAME  \\TEST NAME " \\LABOUR, < > CONSERVATIVE|
	|abstract  	  |b  			|CG: NAME  \\TEST NAME " \\LABOUR, < > CONSERVATIVE|
	|field0		  |				|TEST NAME &quot;				|
	|field1		  |				|LABOUR, &lt; &gt; CONSERVATIVE	|
	|field5		  |				|DSK			|
	|field6		  |				|MANUAL			|
	And I undo abbreviation
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value        |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG        |
	|objArea      |         	|West 1       |
	|objStyle     |         	|NEWS       |
	|objTrigger   |         	|MANUAL       |
	#|objSlug      |         	|CG: NAME  \\TEST NAME " \\Labour, < > Conservative|
	|mosAbstract  |b  			|CG: NAME  \\TEST NAME " \\Labour, < > Conservative|
	|abstract  	  |b  			|CG: NAME  \\TEST NAME " \\Labour, < > Conservative|
	|field0		  |				|TEST NAME &quot;				|
	|field1		  |				|Labour, &lt; &gt; Conservative	|
	|field5		  |				|DSK			|
	|field6		  |				|MANUAL			|
	And I close BigTed Active X
	And I use Alt F4
	And I use RETURN
	And I use Alt F4
	And I use RETURN
	And I use RETURN
	And I use RETURN

@Set_CG_On_Automatic_TC @C653346
Scenario: User set Automatic timing parameter via timecode input on Style OTHERS, CG LOGO ON
	Given timecode is set to "hmsf"
	And I open "CG" tab
	And I select Style "OTHERS" and CG code "NRD LOGO ON"
	When I set CG timming to "AUTOMATIC"
	And I set "In Time" as "10:00:00:00"
	And I set "Duration" as "00:02:12:11"
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value      |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG         |
	|objArea      |         	|West 1     |
	|objStyle     |         	|OTHERS     |
	|objTrigger   |         	|AUTO       |
	#|objSlug      |         	|CG: NRD LOGO ONAUTO: IN AT: 10:00'00  DUR: 00:02'12|
	|mosAbstract  |b  			|CG: NRD LOGO ON|
	|mosAbstract  |  			|AUTO: IN AT: 10:00'00  DUR: 00:02'12|
   	|objParams	  |				|NRD LOGO ON|
    |objStart	  |				|900000		|
    |objDur		  |				|3311		|
	|field0		  |				|DSK		|
	|field1		  |				|AUTO		|
	|field2		  |				|900000		|
	|field3		  |				|903311		|
	Then I paste object in ENPS
	And I check in ENPS to verify "CG" object
	And I close BigTed Active X
	And I use Alt F4
	And I use Alt F4
	And I use RETURN
	And I use RETURN
	And I use RETURN

@Set_CG_On_Automatic_KWBGND_TC @C661937
Scenario: User set Automatic KW/BGND timing parameter via timecode input on Style OTHERS, HARDTALK LOCATOR
Given timecode is set to "hmsf"
	And I open "CG" tab
	And I select Style "OTHERS" and CG code "HARDTALK LOCATOR"
	And I input text in field "Location" in "NONE" case
	When I set CG timming to "AUTO K/W BGND"
	And I set "In Time" as "08:23:63:26"
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value      |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG         |
	|objArea      |         	|West 1     |
	|objStyle     |         	|OTHERS     |
	|objTrigger   |         	|AUTO       |
	#|objSlug      |         	|CG: HARDTALK LOCATOR  \\test LOCATION & CaseAUTO: IN AT: 08:24'04 (KEEP WHILE BACKGROUND)|
	|objMode	  |				|2			|
   	|objParams	  |				|HARDTALK LOCATOR  \\test LOCATION & Case|
    |objStart	  |				|756101		|
    |objDur		  |				|0			|
	|field0		  |				|test LOCATION &amp; Case|
	|field1		  |				|DSK		|
	|field2		  |				|AUTO		|
	|field3		  |				|756101		|
	Then I paste object in ENPS
	And I check in ENPS to verify "CG" object
	And I close BigTed Active X
	And I use Alt F4
	And I use Alt F4
	And I use RETURN
	And I use RETURN
	And I use RETURN

@Set_CG_On_Automatic_KWSTORY_TC @C661938
Scenario: User set Automatic KW/STORY timing parameter via timecode input on Style OTHERS, NEWSWATCH STRAP
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
	#|objSlug      |         	|CG: NEWSWATCH STRAP  \\test NAME " \\test DESIGNATIONAUTO: IN AT: 11:02'01 (KEEP WHILE STORY)|
	|objMode	  |				|3			|
   	|objParams	  |				|NEWSWATCH STRAP  \\test NAME " \\test DESIGNATION|
    |objStart	  |				|993026		|
    |objDur		  |				|0			|
	|field0		  |				|test NAME &quot;	|
	|field1		  |				|test DESIGNATION|
	|field2		  |				|DSK		|
	|field3		  |				|AUTO		|
	|field4		  |				|993026		|
	Then I paste object in ENPS
	And I check in ENPS to verify "CG" object
	And I close BigTed Active X
	And I use Alt F4
	And I use Alt F4
	And I use RETURN
	And I use RETURN
	And I use RETURN



@Set_CG_On_Automatic_NOOUT_TC @C661939
Scenario: User set Automatic NO OUT timing parameter via timecode input on Style POLITICS, CRAWL
	Given timecode is set to "hmsf"
	And I open "CG" tab
	And I select Style "POLITICS" and CG code "CRAWL"
	And I input text in field "Ticker Content" in "NONE" case
	When I set CG timming to "AUTOMATIC"
	And I set "Duration" as "00:00:00:01"
	And I set "In Time" as "99:59:59:24"
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value      |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG         |
	|objArea      |         	|West 1     |
	|objStyle     |         	|POLITICS   |
	|objTrigger   |         	|AUTO       |
	#|objSlug      |         	|CG: CRAWL  \\This ' is a test for TICKER Content!!AUTO: IN AT: 99:59'59  DUR: 00:00'00|
	|objMode	  |				|1			|
   	|objParams	  |				|CRAWL  \\This ' is a test for TICKER Content!!|
    |objStart	  |				|8999998		|
    |objDur		  |				|1			|
	|field0		  |				|This ' is a test for TICKER Content!!|
	|field1		  |				|DSK		|
	|field2		  |				|AUTO		|
	|field3		  |				|8999998	|
	|field4		  |				|8999999	|
	When I set CG timming to "AUTO NO OUT"
	And I set "In Time" as "99:59:59:24"
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value      |
	|mosID        |         	|BIGTED.W1.BBC.MOS  |
	|objType      |         	|CG         |
	|objArea      |         	|West 1     |
	|objStyle     |         	|POLITICS   |
	|objTrigger   |         	|AUTO       |
	#|objSlug      |         	|CG: CRAWL  \\This ' is a test for TICKER Content!!AUTO: IN AT: 99:59'59 (NO AUTO OUT)|
	|objMode	  |				|4			|
   	|objParams	  |				|CRAWL  \\This ' is a test for TICKER Content!!|
    |objStart	  |				|8999998		|
    |objDur		  |				|0			|
	|field0		  |				|This ' is a test for TICKER Content!!|
	|field1		  |				|DSK		|
	|field2		  |				|AUTO		|
	|field3		  |				|8999998	|
	Then I paste object in ENPS
	And I check in ENPS to verify "CG" object
	And I use Alt F4
	And I use Alt F4
	And I use RETURN
	And I use RETURN
	And I use RETURN
