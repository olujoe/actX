#####################################################################################################################################################
##### This is feature file for CG Set Home Style feature#####
##### Author: Brian Tsang
#####################################################################################################################################################

@CG_Set_Home_Style
Feature: CG_Set_Home_Style
Background: As a user, I wan to open BigTed Active X and select tab CG.So I can create/edit CG item to insert into running order in ENPS.
	When I go to ENPS
	Then I start "West1"
	#Then I open "CG" tab


@Assign_Home_NEWS @C653338
Scenario: As a User, I want to set Home Sytle in CG tab within Active X - NEWS. So that when I open CG tab in Active X from ENPS, the default home style is loaded. 
	Given site "West1" is opened
	And I open "CG" tab
	When I assign Style "NEWS" as HomeStyle
	Then "CG" section open in "West1"
	And I check my HomeStyle is Set "NEWS"

@Assign_Home_NEWSNIGHT @C661927
Scenario: As a User, I want to set Home Sytle in CG tab within Active X - NEWSNIGHT. So that when I open CG tab in Active X from ENPS, the default home style is loaded. 
	Given site "West1" is opened
	And I open "CG" tab
	When I assign Style "NEWSNIGHT" as HomeStyle
	Then "CG" section open in "West1"
	And I check my HomeStyle is Set "NEWSNIGHT"


@Assign_Home_POLITICS @C661928
Scenario: As a User, I want to set Home Sytle in CG tab within Active X - POLITICS. So that when I open CG tab in Active X from ENPS, the default home style is loaded. 
	Given site "West1" is opened
	And I open "CG" tab
	When I assign Style "POLITICS" as HomeStyle
	Then "CG" section open in "West1"
	And I check my HomeStyle is Set "POLITICS"


@Assign_Home_OTHERS @C661929
Scenario: As a User, I want to set Home Sytle in CG tab within Active X - OTHERS. So that when I open CG tab in Active X from ENPS, the default home style is loaded. 
	Given site "West1" is opened
	And I open "CG" tab
	When I assign Style "OTHERS" as HomeStyle
	Then "CG" section open in "West1"
	And I check my HomeStyle is Set "OTHERS"
