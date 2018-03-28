#####################################################################################################################################################
##### This is the Featire file for Clip Search test cases#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
#####################################################################################################################################################

#Step Definitions - start_BigTedActiveX_steps.rb
@Clip_search_airspeed
Feature: Clip Search
Background: Open BC_PQ_QA
	Given I go to ENPS
	And I start "BC_PQ_QA"

@Clip_view_clip_detail_airspeed @C653350
Scenario: Clip_view_clip_detail
	Given I open "CLIP" tab
	And "CLIP" section open in "BC_PQ_QA"
	When I search "clipname2"
	And I can view all result
	Then I view clip detail
	And I go back to search

@Clip_view_clip_detail_showmore_airspeed @C653351
Scenario: Clip_view_clip_detail_showmore
	Given "CLIP" section open in "BC_PQ_QA"
	When I search "clipname2"
	And I can view all result
	Then I view clip detail
	And I can see more detail
	And I go back to search

@Clip_view_clip_back_to_seach_airspeed @C653352
Scenario: Clip_view_clip_back_to_seach
	Given "CLIP" section open in "BC_PQ_QA"
	When I search "clipname3"
	And I can view all result
	Then I view clip detail
	And I go back to search


@Clip_view_clip_detail_copy_clipname_airspeed @C653353
Scenario: Clip_view_clip_detail_copy_clipname
	Given "CLIP" section open in "BC_PQ_QA"
	And I search "clipname4"
	And I can view all result
	When I view clip detail
	Then I can copy clipname
#	And I check title "clipname4"
	And I go back to search

############ Search show Finished and Placeholder only ############

@Clip_Search_News_within_last_hour_BigTedW1_airspeed @C653359
Scenario: Clip_Search_NEWS_within_last_hour
	Given "CLIP" section open in "BC_PQ_QA"
	When I search "NEWS last hour"
	Then I can view result


@Clip_Search_News_within_last_6hours_BigTedW1_airspeed @C653360
Scenario: Clip_Search_NEWS_within_last_6hours
	#Given "CLIP" section open in "BC_PQ_QA"
	When I search "NEWS last 6 hours"
	Then I can view result





@Clip_Search_News_within_last_day_BigTedW1_airspeed @C653361
Scenario: Clip_Search_NEWS__within_last_day
	#Given "CLIP" section open in "BC_PQ_QA"
	When I search "NEWS last day"
	Then I can view result



@Clip_Search_News_within_last_week_BigTedW1_airspeed @C653362
Scenario: Clip_Search_NEWS_within_last_week
	#Given "CLIP" section open in "BC_PQ_QA"
	When I search "NEWS last week"
	Then I can view result



@Clip_Search_News_at_anytime_BigTedW1_airspeed @C653363
Scenario: Clip_Search_NEWS_at_anytime
	#Given "CLIP" section open in "BC_PQ_QA"
	When I search "NEWS at anytime"
	Then I can view result
	#And I close BigTed Active X


##### Search Show All  ############

@Clip_Search_all_News_within_last_hour_BigTedW1_airspeed @C668815
Scenario: Clip_Search_NEWS_within_last_hour
	#Given "CLIP" section open in "BC_PQ_QA"
	When I search "NEWS last hour"
	Then I can view all result


@Clip_Search_all_News_within_last_6hours_BigTedW1_airspeed @C668816
Scenario: Clip_Search_NEWS_within_last_6hours
	#Given "CLIP" section open in "BC_PQ_QA"
	When I search "NEWS last 6 hours"
	Then I can view all result



@Clip_Search_all_News_within_last_day_BigTedW1_airspeed @C668817
Scenario: Clip_Search_NEWS__within_last_day
	#Given "CLIP" section open in "BC_PQ_QA"
	When I search "NEWS last day"
	Then I can view all result



@Clip_Search_all_News_within_last_week_BigTedW1_airspeed @C668818
Scenario: Clip_Search_NEWS_within_last_week
	#Given "CLIP" section open in "BC_PQ_QA"
	When I search "NEWS last week"
	Then I can view all result



@Clip_Search_all_News_at_anytime_BigTedW1_airspeed @C668819
Scenario: Clip_Search_NEWS_at_anytime
	#Given "CLIP" section open in "BC_PQ_QA"
	When I search "NEWS at anytime"
	Then I can view result
	#And I close BigTed Active X
	And I use Alt F4


#Scenario:Close BigTed ActiveX
#	And I close BigTed Active X

########## Clip Player controls  ############


#@testclip

#Scenario: test
#	Then I can copy clipname
#	#And I open a new notepad session
#	And I check title "clipname1"
