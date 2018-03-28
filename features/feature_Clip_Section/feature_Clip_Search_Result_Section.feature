#####################################################################################################################################################
##### This is the Featire file for Clip Search/Result sorting test cases#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
#####################################################################################################################################################

@Clip_Search_Result
Feature: Clip Search/ Result sorting
Background:
	Given I go to ENPS
	And I start "West1"
############ Sorting coloumn is result table  ############

@Clip_Search_all_News_anytime_BigTedW1_sortbyname @C653364
Scenario: Clip_Search_Results_sorting_Name
	Given "CLIP" section open in "West1"
	When I search "NEWS at anytime"
	Then I can view all result
	And I sort result by "name"

@Clip_Search_all_News_anytimek_BigTedW1_sortbydate @C653365
Scenario: Clip_Search_Results_sorting_Date
	#Given "CLIP" section open in "West1"
	When I search "NEWS at anytime"
	Then I can view all result
	And I sort result by "date"

@Clip_Search_all_News_anytime_BigTedW1_sortbyrating @C653366
Scenario: Clip_Search_Results_sorting_Rating
	#Given "CLIP" section open in "West1"
	When I search "NEWS at anytime"
	Then I can view all result
	And I sort result by "rating"

@Clip_Search_all_News_anytime_BigTedW1_sortbyduration @C653367
Scenario: Clip_Search_Results_sorting_Duration
	#Given "CLIP" section open in "West1"
	When I search "NEWS at anytime"
	Then I can view all result
	And I sort result by "duration"

@Clip_Search_all_News_anytime_BigTedW1_sortbycategory @C653368
Scenario: Clip_Search_Results_sorting_Category
	#Given "CLIP" section open in "West1"
	When I search "NEWS at anytime"
	Then I can view all result
	And I sort result by "category"


@Clip_Search_all_News_anytime_BigTedW1_sortbystatus @C653369
Scenario: Clip_Search_Results_sorting_Status
	#Given "CLIP" section open in "West1"
	When I search "NEWS at anytime"
	Then I can view all result
	And I sort result by "status"

@Clip_Search_all_News_anytime_BigTedW1_sortbyoutlet @C653370
Scenario: Clip_Search_Results_sorting_Outlet
	#Given "CLIP" section open in "West1"
	When I search "NEWS at anytime"
	Then I can view all result
	And I sort result by "outlet"


########## Arrange coloumn in result table  ############

@Clip_Search_all_News_anytime_BigTedW1_column_arrange @C653371
Scenario: Clip_Search_Results_column_arrangement
	Given "CLIP" section open in "West1"
	When I search "NEWS at anytime"
	Then I can view all result
	And I arrange result column
	#And I close BigTed Active X
	And I use Alt F4

#Scenario:Close BigTed ActiveX
#	And I close BigTed Active X
