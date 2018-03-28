#####################################################################################################################################################
##### This is feature file for CG Load Template according to Style and CG code feature#####
##### Author: Brian Tsang
#####################################################################################################################################################

@CG_Load_Template
Feature: CG_Load_Template
Background: As a user, I wan to open BigTed Active X and select tab CG.So I can create/edit CG item to insert into running order in ENPS.
	When I go to ENPS
	Then I start "West1"
	#Then I open "CG" tab


@Load_template_NEWS @C665045
Scenario: As a user, I am able to select different style and CG code combination - NEWS. So I can customise text using the per-defined template and insert CG object into running order.

	Given site "West1" is opened
	And I open "CG" tab
	And I check Template for each CG code for "NEWS"

@Load_template_NEWSNIGHT @C665046
Scenario: As a user, I am able to select different style and CG code combination - NEWSNIGHT. So I can customise text using the per-defined template and insert CG object into running order.

	Given site "West1" is opened
	And I open "CG" tab
	And I check Template for each CG code for "NEWSNIGHT"


@Load_template_POLITICS @C665047
Scenario: As a user, I am able to select different style and CG code combination - POLITICS. So I can customise text using the per-defined template and insert CG object into running order.

	Given site "West1" is opened
	And I open "CG" tab
	And I check Template for each CG code for "POLITICS"


@Load_template_OTHERS @C665048
Scenario: As a user, I am able to select different style and CG code combination - OTHERS. So I can customise text using the per-defined template and insert CG object into running order.

	Given site "West1" is opened
	And I open "CG" tab
	And I check Template for each CG code for "OTHERS"
	And I use Alt F4
	And I use Alt F4
	And I use RETURN

#***THIS SCENARIO IS TEMPORARILY SUSPENDED UNTIL JUPITER/NATIONAL ISSUE IS FIXED!***
#@Story_Brand_Image_preview @C653340
#Scenario: As a user, I am able to select style and CG code (STORY BRAND) combination - NEWS.  Load Story Brand Image to preview

#	Given site "West1" is opened
#	When I open "CG" tab
#	And I select Style "NEWS" and CG code "STORY BRAND"
#	Then I check story brand image under NEWS
