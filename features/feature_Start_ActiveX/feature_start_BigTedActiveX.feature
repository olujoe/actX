@Start_ActiveX_BigTed
Feature: Start_ActiveX_BigTedW1
#Step Definitions - start_BigTedActiveX_steps.rb

Background: Open ENPS
	Given I go to ENPS

@BigTedW1 @C653331
Scenario: Start_BigtedActiveX
	When I start "West1"
	Then site "West1" is opened
	And I close BigTed Active X

@BigTedMillbank @C661930
Scenario: Open BigTedMillbank
	When I start "Millbank"
	Then site "Millbank" is opened
	And I close BigTed Active X

@PlymouthBigTed @C661931
Scenario: Open PlymouthBigTed
	When I start "Plymouth"
	Then site "Plymouth" is opened
	And I close BigTed Active X

@BigTedATVPTV @C661932
Scenario: Open BigTedATVPTV
	When I start "ATVPTV"
	Then site "ATVPTV" is opened
	And I close BigTed Active X

@BC_PQ_QA 
Scenario: Open BC_PQ_QA
	When I start "BC_PQ_QA"
	Then site "BC_PQ_QA" is opened
	Then I open "CLIP" tab
	And I close BigTed Active X

@BigTedW1CLIP @C653349
Scenario: Open BigTedW1 CLIP
	Given I start "West1"
	When site "West1" is opened
	Then I open "CLIP" tab
	And I close BigTed Active X

@BigTedW1CG @C653337
Scenario: Open BigTedW1 CG
	Given I start "West1"
	When site "West1" is opened
	Then I open "CG" tab
	And I close BigTed Active X

@BigTedW1MOSART @C653387
Scenario: Open BigTedW1 MOSART
	Given I start "West1"
	When site "West1" is opened
	Then I open "MOSART" tab
	And I close BigTed Active X

@C653334 @Create_multiple_objects_from_2_or_More_Sites
Scenario: As a user, I want to create 2 or more Graphical objects from 2 different source location (site). So that it can be inserted in running order within ENPS.
	Given I go to ENPS
	And I start "West1"
	And I open "CG" tab
	And I select Style "POLITICS" and CG code "COMING UP"
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
	#|objSlug      |         	|CG: COMING UP  \\Test Cg Tabtext \\Test Cg Straptext  |
	|mosAbstract  |b  			|CG: COMING UP  \\Test Cg Tabtext \\Test Cg Straptext|
	|field0		  |				|Test Cg Tabtext		|
	|field1		  |				|Test Cg Straptext|
	|field5		  |				|DSK			|
	|field6		  |				|MANUAL			|
	And I paste object in ENPS
	And I check in ENPS to verify "CG" object
	Then I start "Millbank"
	And I open "CG" tab
	And I select Style "NEWS" and CG code "NAME"
	And I input text in field "Name" in "UPPER" case
	And I input text in field "Designation Abbr" in "UPPER" case
	And I check for abbreviation "2"
	And I copy object
	And I check mos CG object xml:
	|field        |subfield     |value        |
	|mosID        |         	|BIGTED.MILLBANK.BBC.MOS |
	|objType      |         	|CG        |
	|objArea      |         	|Millbank       |
	|objStyle     |         	|NEWS       |
	|objTrigger   |         	|MANUAL       |
	#|objSlug      |         	|CG: NAME  \\TEST NAME " \\Lab, < > Con|
	|mosAbstract  |b  			|CG: NAME  \\TEST NAME " \\Lab, < > Con|
	|field0		  |				|TEST NAME &quot;				|
	|field1		  |				|Lab, &lt; &gt; Con		|
	|field5		  |				|DSK			|
	|field6		  |				|MANUAL			|
	And I paste object in ENPS
	And I check in ENPS to verify "CG" object

Scenario:Close BigTed ActiveX
	And I close BigTed Active X
#@sitetest1
#Scenario: test
