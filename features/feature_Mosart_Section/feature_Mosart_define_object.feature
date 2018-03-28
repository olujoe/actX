#####################################################################################################################################################
##### This is feature file for Mosart define object feature test cases#####
##### Author: Brian Tsang
#####################################################################################################################################################
@Mosart_define_object
Feature: Mosart_define_object
#Background: As a user, I wan to open BigTed Active X and select tab Mosart.So I can create/edit Mosart item to insert into running order in ENPS.
#	When I go to ENPS
#	Then I start "West1"

@set_transition_MIX @C653390
Scenario: User select Set 8PM SUMM, Template CAMERA and Variant 1, set Transition MIX and enter frames value (Integer 1500 max limit)
	Given I go to ENPS
	When I start "West1"
	And site "West1" is opened
	And I open "MOSART" tab
	And I select Set "8PMSUMM" and Template "CAMERA"
	And I select variant "0"
	When I set mosart transition "MIX"
	And I set "1500" frames
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |8 PM SUMM       |
	|objSlug        |         	  |MOSART CAMERA - 1|
	|mosAbstract    |b  		  |MOSART CAMERA - 1|
	|objTB          |             |25                            |
	|type		    |			  |CAMERA			|
	|variant	    |			  |1				|
	|transition	    |			  |MIX				|
	|field		  	|			  |1500				|
	And I use Alt F4

@set_transition_WIPE @C668934
Scenario: User select Set 8PM SUMM, Template BREAK and Variant 1, set Transition WIPE and enter frames value (Integer under 1500)
	Given I go to ENPS
	When I start "West1"
	And site "West1" is opened
	And I open "MOSART" tab
	And I select Set "8PMSUMM" and Template "BREAK"
	And I select variant "2"
	When I set mosart transition "WIPE"
	And I set "835" frames
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |8 PM SUMM       |
	|objSlug        |         	  |MOSART BREAK - END|
	|mosAbstract    |b  		  |MOSART BREAK - END|
	|objTB          |             |25                            |
	|type		    |			  |BREAK			|
	|variant	    |			  |END				|
	|transition	    |			  |WIPE				|
	|field		  	|			  |835			|
	And I use Alt F4


@set_transition_EFFECT @C668935
Scenario: User select Set LDN, Template FLOAT and Variant 1, set Transition to effect and select effect 2nd in the list
	Given I go to ENPS
	When I start "West1"
	Given site "West1" is opened
	And I open "MOSART" tab
	And I select Set "LDN" and Template "FLOAT"
	And I select variant "0"
	When I set mosart transition "EFFECT"
	And I set effect "2"
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |LDN       |
	|objSlug        |         	  |MOSART FLOAT - FULL FRAME|
	|mosAbstract    |b  		  |MOSART FLOAT - FULL FRAME|
	|objTB          |             |25                            |
	|type		    |			  |FLOAT			|
	|variant	    |			  |FULL FRAME				|
	|transition	    |			  |EFFECT				|
	|field		  	|			  |20			|
	And I use Alt F4


#@set_transition_DEFAULT @C668936
#Scenario: User select Set 8PM SUMM, Template CAMERA and Variant 1, set Transition To default
#	Given site "West1" is opened
#	And I open "MOSART" tab
#	And I select Set "ARABICXTRA" and Template "BREAK"
#	And I select variant "1"
#	When I set mosart transition "DEFAULT"
#	And I copy object
#	Then I check mos MOSART object xml:
#	|field        	|subfield     |value        |
#	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
#	|objType      	|         	  |MOSART        |
#	|objArea      	|         	  |West 1       |
#	|objStyle     	|         	  |ARABIC XTRA       |
#	|objSlug        |         	  |MOSART BREAK - START|
#	|mosAbstract    |b  		  |MOSART BREAK - START|
#	|objTB          |             |25                            |
#	|type		    |			  |BREAK		|
#	|variant	    |			  |START				|


@set_relative_in_time_hms @C653391
Scenario: User select Set LDN, Template ACCESSORIES and Variant 2 - INSET SERVER, set Occurs at to Relative to start enter 00:02:00
	Given I go to ENPS
	When I start "West1"
	Given site "West1" is opened
	And timecode is set to "hms"
	And I open "MOSART" tab
	And I select Set "LDN" and Template "ACCESSORIES"
#	And I select variant "1"
	And I select variant "2"
	When I select occurs at "Relative to start"
	And I set "Relative to start" as "00:02:00"
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |LDN      |
	|objSlug        |         	  |MOSART ACCESSORIES - INSET SERVER|
	|mosAbstract    |b  		  |MOSART ACCESSORIES - INSET SERVER|
	|objMode		|			  |InTime |
	|objStart		|			  |3000 |
	|objTB          |             |25                            |
	|type		    |			  |ACCESSORIES		|
	|variant	    |			  |INSET SERVER				|
	|field          |             |3000             |
	And I use Alt F4


@set_relative_in_time_hmsf @C668988
Scenario: User select Set LDN, Template ACCESSORIES and Variant 4 - INSET GRAPHICS, set Occurs at to Relative to start enter 00:01:29:24
	Given I go to ENPS
	When I start "West1"
	Given site "West1" is opened
	And timecode is set to "hmsf"
	And I open "MOSART" tab
	And I select Set "LDN" and Template "ACCESSORIES"
#	And I select variant "3"
	And I select variant "4"
	When I select occurs at "Relative to start"
	And I set "Relative to start" as "00:01:29:24"
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |LDN      |
	|objSlug        |         	  |MOSART ACCESSORIES - INSET GRAPHICS|
	|mosAbstract    |b  		  |MOSART ACCESSORIES - INSET GRAPHICS|
	|objMode		|			  |InTime |
	|objStart		|			  |2249 |
	|objTB          |             |25                            |
	|type		    |			  |ACCESSORIES		|
	|variant	    |			  |INSET GRAPHICS			|
	|field          |             |2249             |
	And I use Alt F4


@set_absolute_time_of_day @C653392
Scenario: User select Set LDN, Template SOUND and Variant 1 - 002 FADE PREVIEW TEST, set Occurs at to Absolute time of day and enter 25:00:00
	Given I go to ENPS
	When I start "West1"
	Given site "West1" is opened
	And timecode is set to "hms"
	And I open "MOSART" tab
	And I select Set "LDN" and Template "SOUND"
	And I select variant "0"
	When I select occurs at "Absolute time of day"
	And I set "Absolute time of day" as "25:00:00"
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |LDN      |
	|objSlug        |         	  |MOSART SOUND - 002 FADE PREVIEW TEST|
	|mosAbstract    |b  		  |MOSART SOUND - 002 FADE PREVIEW TEST|
	|objTB          |             |25                            |
	|type		    |			  |SOUND		|
	|variant	    |			  |002 FADE PREVIEW TEST		|
	|field          |             |@23:59:59             |
	And I use Alt F4


@set_template_parameter @C653393
Scenario: User select Set LDN, Template FLOAT and Variant 3 - LIVE PIX FULL FRAME, set addtional parameter to Camera 3
	Given I go to ENPS
	When I start "West1"
	Given site "West1" is opened
	And I open "MOSART" tab
	And I select Set "LDN" and Template "FLOAT"
	And I select variant "2"
	When I select "2" from "OS" in addtional parameters
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |LDN      |
	|objSlug        |         	  |MOSART FLOAT - LIVE PIX FULL FRAME|
	|mosAbstract    |b  		  |MOSART FLOAT - LIVE PIX FULL FRAME|
	|objTB          |             |25                            |
	|type		    |			  |FLOAT		|
	|variant	    |			  |LIVE PIX FULL FRAME		|
	|field          |             |Camera 3           |
	And I use Alt F4


@set_duration_1 @C653394
Scenario: User select Set LDN, Template GRAPHICS and Variant 5 - TRAFFIC CAM START, set duration to 99:59:61
	Given I go to ENPS
	When I start "West1"
	Given site "West1" is opened
	And timecode is set to "hms"
	And I open "MOSART" tab
	And I select Set "LDN" and Template "GRAPHICS"
	And I select variant "4"
#	And I select variant "0"
	When I set "Mosart Duration" as "99:59:61"
	And I copy object
	Then I check mos MOSART object xml:
	|field        		|subfield     |value        |
	|mosID        		|         	  |BIGTED.W1.BBC.MOS  |
	|objType      		|         	  |MOSART        |
	|objArea      		|         	  |West 1       |
	|objStyle     		|         	  |LDN      |
	|objSlug        	|         	  |MOSART GRAPHICS - TRAFFIC CAM START|
	|mosAbstract    	|b  		  |MOSART GRAPHICS - TRAFFIC CAM START|
	|objDur				|			  |8999999	|
	|itemEdDur			|			  |8999999	|
	|itemUserTimingDur	|			  |8999999	|
	|objTB          |             |25                            |
	|type		    	|			  |GRAPHICS		|
	|variant	    	|			  |TRAFFIC CAM START		|
	And I use Alt F4


@set_duration_2 @C669000
Scenario: User select Set LDN, Template GRAPHICS and Variant 14 - TUBE UPDATE, set duration to 00:01:19:25
	Given I go to ENPS
	When I start "West1"
	Given site "West1" is opened
	And timecode is set to "hmsf"
	And I open "MOSART" tab
	And I select Set "LDN" and Template "GRAPHICS"
#	And I select variant "13"
#	And I select variant "9"
	And I select variant "14"
	When I set "Mosart Duration" as "00:01:19:25"
	And I copy object
	Then I check mos MOSART object xml:
	|field        		|subfield     |value        |
	|mosID        		|         	  |BIGTED.W1.BBC.MOS  |
	|objType      		|         	  |MOSART        |
	|objArea      		|         	  |West 1       |
	|objStyle     		|         	  |LDN      |
	|objSlug        	|         	  |MOSART GRAPHICS - TUBE UPDATE|
	|mosAbstract    	|b  		  |MOSART GRAPHICS - TUBE UPDATE|
	|objDur				|			  |2000	|
	|itemEdDur			|			  |2000	|
	|itemUserTimingDur	|			  |2000	|
	|objTB          |             |25                            |
	|type		    	|			  |GRAPHICS		|
	|variant	    	|			  |TUBE UPDATE		|
	And I use Alt F4


@set_additional_parameters_hms @C735403
Scenario: User select Set GMT, Template ACCESSORIES and Variant 43, set Transition to effect and select effect 2nd in the list
	Given I go to ENPS
	When I start "West1"
	Given site "West1" is opened
	And timecode is set to "hms"
	And I open "MOSART" tab
	And I select Set "GMT" and Template "ACCESSORIES"
	And I select variant "43"
	When I set "Mosart Duration" as "00:01:19"
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |GMT       |
	|objSlug        |         	  |MOSART ACCESSORIES - LED DTL TRIPLE|
	|mosAbstract    |b  		  |MOSART ACCESSORIES - LED DTL TRIPLE|
	#|mosAbstract    |b  		  |MOSART ACCESSORIES - LED DTL TRIPLE<br />left os : Camera 1<br />right os : Camera 1<br />central os : Camera 1|
	|objTB          |             |25                            |
	|type		    |			  |ACCESSORIES			|
	|variant	    |			  |LED DTL TRIPLE				|
#	|transition	    |			  |DEFAULT				|
#	|field		  	|			  |20			|
	And I use Alt F4



@set_additional_parameters_hmsf @C735404
Scenario: User select Set GMT, Template ACCESSORIES and Variant 43, set Transition to effect and select effect 2nd in the list
	Given I go to ENPS
	When I start "West1"
	Given site "West1" is opened
	And timecode is set to "hmsf"
	And I open "MOSART" tab
	And I select Set "GMT" and Template "ACCESSORIES"
	And I select variant "43"
	When I set "Mosart Duration" as "00:01:19:25"
	And I copy object
	Then I check mos MOSART object xml:
	|field        	|subfield     |value        |
	|mosID        	|         	  |BIGTED.W1.BBC.MOS  |
	|objType      	|         	  |MOSART        |
	|objArea      	|         	  |West 1       |
	|objStyle     	|         	  |GMT       |
	|objSlug        |         	  |MOSART ACCESSORIES - LED DTL TRIPLE|
	|mosAbstract    |b  		  |MOSART ACCESSORIES - LED DTL TRIPLE|
	#|mosAbstract    |b  		  |MOSART ACCESSORIES - LED DTL TRIPLE<br />left os : Camera 1<br />right os : Camera 1<br />central os : Camera 1|
	|objTB          |             |25                            |
	|type		    |			  |ACCESSORIES			|
	|variant	    |			  |LED DTL TRIPLE				|
#	|transition	    |			  |DEFAULT				|
#	|field		  	|			  |20			|
	And I use Alt F4
