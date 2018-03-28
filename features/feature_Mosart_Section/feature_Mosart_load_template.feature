###########################################################################################################################################
##### This is feature file for Mosart Load Template feature#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
###########################################################################################################################################
### To add new test, you need to add detail in config.yml and the Set name needs to be include in this feature file.####
###########################################################################################################################################

@Mosart_load_template
Feature: Mosart_load_template
Background: As a user, I wan to open BigTed Active X and select tab Mosart.So I can create/edit Mosart item to insert into running order in ENPS.
	When I go to ENPS
	Then I start "West1"


@Load_template_8PMSUMM @C653389
Scenario: As a user, I am able to select different style and MOSART code combination - NEWS. So I can customise text using the per-defined template and insert MOSART object into running order.
	Given site "West1" is opened
	When I open "MOSART" tab
	Then I select Template for each SET for "8PMSUMM"
	And I use Alt F4


@Load_template_LDN @C668932
Scenario: As a user, I am able to select different style and MOSART code combination - NEWS. So I can customise text using the per-defined template and insert MOSART object into running order.
	Given site "West1" is opened
	When I open "MOSART" tab
	Then I select Template for each SET for "LDN"
	And I use Alt F4


@Load_template_NEWSNIGHT @C668933
Scenario: As a user, I am able to select different style and MOSART code combination - NEWS. So I can customise text using the per-defined template and insert MOSART object into running order.
	Given site "West1" is opened
	When I open "MOSART" tab
	Then I select Template for each SET for "NEWSNIGHT"
	And I use Alt F4


#@Load_template_ARABICXTRA @C668931
#Scenario: As a user, I am able to select different style and MOSART code combination - NEWS. So I can customise text using the per-defined template and insert MOSART object into running order.

#	Given site "West1" is opened
#	When I open "MOSART" tab
#	Then I select Template for each SET for "ARABICXTRA"
#	Then I select Template for each SET for "ARABICXTRA"