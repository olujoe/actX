###########################################################################################################################################
##### This is feature file for Mosart Set Home Set feature#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
###########################################################################################################################################
### To add new test, you need to add detail in config.yml and the Set name needs to be include in this feature file.####
###########################################################################################################################################

@Mosart_Set_Home_Set
Feature: Mosart_Set_Home_Set
Background: As a user, I wan to open BigTed Active X and select tab Mosart.So I can create/edit Mosart item to insert into running order in ENPS.
	When I go to ENPS
	Then I start "West1"


@Assign_Home_Set_8PMSUMM @C653388
Scenario: As a user, I am able to select different style and MOSART code combination - NEWS. So I can customise text using the per-defined template and insert MOSART object into running order.
	Given site "West1" is opened
	And I open "MOSART" tab
	When I assign Set "8PMSUMM" as HomeSet
	Then I check my HomeSet is Set "8PMSUMM"
	And I use Alt F4

@Assign_Home_Set_LDN @C668928
Scenario: As a user, I am able to select different style and MOSART code combination - NEWS. So I can customise text using the per-defined template and insert MOSART object into running order.
	Given site "West1" is opened
	And I open "MOSART" tab
	When I assign Set "LDN" as HomeSet
	Then I check my HomeSet is Set "LDN"
	And I use Alt F4

@Assign_Home_Set_NEWSNIGHT @C668929
Scenario: As a user, I am able to select different style and MOSART code combination - NEWS. So I can customise text using the per-defined template and insert MOSART object into running order.
	Given site "West1" is opened
	And I open "MOSART" tab
	When I assign Set "NEWSNIGHT" as HomeSet
	Then I check my HomeSet is Set "NEWSNIGHT"
	And I use Alt F4

@Assign_Home_Set_WORLDNEWS @C668930
Scenario: As a user, I am able to select different style and MOSART code combination - NEWS. So I can customise text using the per-defined template and insert MOSART object into running order.
	Given site "West1" is opened
	And I open "MOSART" tab
	When I assign Set "WORLDNEWS" as HomeSet
	Then I check my HomeSet is Set "WORLDNEWS"
	And I use Alt F4


#@Assign_Home_Set_ARABICXTRA @C668927
#Scenario: As a user, I am able to select different style and MOSART code combination - NEWS. So I can customise text using the per-defined template and insert MOSART object into running order.

#	Given site "West1" is opened
#	And I open "MOSART" tab
#	When I assign Set "ARABICXTRA" as HomeSet
#	Then I check my HomeSet is Set "ARABICXTRA"