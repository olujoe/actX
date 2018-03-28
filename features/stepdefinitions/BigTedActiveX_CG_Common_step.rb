#####################################################################################################################################################
##### This is the step definition that drives the action of CG test cases#####
##### Author: Brian Tsang
#####################################################################################################################################################
When (/^I assign Style "([^"]*)" as HomeStyle$/) do |style|
  begin
		$config["West1"]["cgstyles"].each do |styles| #Starts of the loop
			#puts styles
			if (styles[0]==style)
				#puts "yes"
					styles[1].each do |checkstyle|
						cgcode = checkstyle["cgcode"]
						image = checkstyle["image"]
						image1 = checkstyle["image1"]
						image2 = checkstyle["image2"]
						typekey = checkstyle["typekey"]
						cgcodekey = checkstyle["cgcodekey"]

						step 'I click "80" pixels to the "right" of "cgstyle.png"'
						step 'I use Home'
						step 'I use RETURN'
								typekey.to_i.times do
					    			@screen.type(Sikuli::DOWNARROW)
					    			sleep(0.3)
					    		end
					    	sleep (2)
				    	puts "Found Style!!"
				    	sleep (2)
				    	step 'I should see either "'+image+'" or "'+image1+'"'
				    	step 'I click on "setHomestyle.png"'
				    	step 'I close BigTed Active X'
				    	break
					end
			end
    end
  rescue
    puts "I assign Style #{style} as HomeStyle has failed"
  end
end

Then (/^I check my HomeStyle is Set "([^"]*)"$/) do |style|
  begin
		$config["West1"]["cgstyles"].each do |styles| #Starts of the loop
			if (styles[0]==style)
				puts "yes"
					styles[1].each do |checkstyle|
								cgcode = checkstyle["cgcode"]
								image = checkstyle["image"]
								image1 = checkstyle["image1"]
								image2 = checkstyle["image2"]
								typekey = checkstyle["typekey"]
								cgcodekey = checkstyle["cgcodekey"]
					step 'I click "80" pixels to the "right" of "cgstyle.png"'
			    	step 'I use End'
			    	step 'I use RETURN'
			    	step 'I click on "selecthomestyle.png"'
			    	step 'I should see either "'+image+'" or "'+image1+'"'
			    	break
		    		end
		  	end
    end
  rescue
		puts "I check my HomeStyle is Set #{style} has failed"
  end
end

=begin
When (/^I set CG Homestyle to "(.*?)"$/) do |setHomestyle|
	if !(@screen.exists $styleA || $styleAhl)
		step 'I click "80" pixels to the "right" of "cgstyle.png"'
		step 'I use Home'
		step 'I click on "setHomestyle.png"'
		step 'I should see either "'+$styleA+'" or "'+$styleAhl+'"'
	end
	step 'I click "80" pixels to the "right" of "cgstyle.png"'
		if (setHomestyle == "styleA")
			step 'I use Home'
			step 'I use RETURN'
			step 'I click on "setHomestyle.png"'
			step 'I should see either "'+$styleA+'" or "'+$styleAhl+'"'
		elsif (setHomestyle == "styleB")
			step 'I use Home'
			step 'I use Down'
			step 'I use RETURN'
			step 'I click on "setHomestyle.png"'
			step 'I should see either "'+$styleB+'" or "'+$styleBhl+'"'
		elsif (setHomestyle == "styleC")
			step 'I use Home'
			step 'I use the DOWNARROW "2" times'
			step 'I use RETURN'
			step 'I click on "setHomestyle.png"'
			step 'I should see either "'+$styleC+'" or "'+$styleChl+'"'
		elsif (setHomestyle == "styleD")
			step 'I use End'
			step 'I use RETURN'
			step 'I click on "setHomestyle.png"'
			step 'I should see either "'+$styleD+'" or "'+$styleDhl+'"'
		end
	step 'I close BigTed Active X'
end

Then (/^I can select CG Homestyle "(.*?)"$/) do |selectHomestyle|
	step 'I click on "selecthomestyle.png"'
	if (selectHomestyle == "styleA")
		step 'I should see either "'+$styleA+'" or "'+$styleAhl+'"'
	elsif (selectHomestyle == "styleB")
		step 'I should see either "'+$styleB+'" or "'+$styleBhl+'"'
	elsif (selectHomestyle == "styleC")
		step 'I should see either "'+$styleC+'" or "'+$styleChl+'"'
	elsif (selectHomestyle == "styleD")
		step 'I should see either "'+$styleD+'" or "'+$styleDhl+'"'
	else
		fail ("No Style Found!")
	end
	step 'I close BigTed Active X'
end


=end

##################################################################################################################
### This is the code that runs a loop through all the values stored in config.yml
### The argument you pass in the feature file is the style you have chosen to run, it will go through each cgcode
### specified in confing.yml
### By adding or remove values in config.yml, you will increase the number of array or reduce

### You are able to specify specific steps you wish to run when the loop is selecting a combination through the dropdown
### For instance, if (cgcode == NEWS NAME) in Style News, CG code Name, within the loop
### it will enter some value and copy the item to ENPS and checks for validation
### You can added different steps you wish to perform for another CG code
##################################################################################################################

Then (/^I check Template for each CG code for "(.*?)"$/) do |style|
  begin
		step 'I click on "cgclear.png"'
		index = 0
		$config["West1"]["cgstyles"][style].each do |styles|
			cgcode = styles["cgcode"]
			image = styles["image"]
			image1 = styles["image1"]
			image2 = styles["image2"]
			typekey = styles["typekey"]
			cgcodekey = styles["cgcodekey"]
			puts styles

			if(index == 0)
				step 'I click "80" pixels to the "right" of "cgstyle.png"'
				step 'I use Home'
				step 'I use RETURN'
					typekey.to_i.times do
		    			@screen.type(Sikuli::DOWNARROW)
		    			sleep(0.3)
		    		end
		    	sleep (2)
	    	end
	    	step 'I click "80" pixels to the "right" of "cgcode.png"'
			step 'I use Home'
			step 'I use RETURN'
				cgcodekey.to_i.times do
	    			@screen.type(Sikuli::DOWNARROW)
	    			sleep(0.3)
	    		end
	    	sleep (2)
	    	step 'I should see "'+image+'" with high accuracy "0.87"'
	    	index = 1

	    	if (cgcode == "NEWS NAME")

				steps %Q{
					And I input text in field "Name" in "LOWER" case
					And I input text in field "Designation" in "LOWER" case
			    	And I copy object
					And I check mos CG object xml:
					|field        |subfield     |value        |
	  				|mosID        |         	|BIGTED.W1.BBC.MOS  |
	  				|objType      |         	|CG        |
	  				|objArea      |         	|West 1       |
	  				|objStyle     |         	|NEWS       |
					|objTrigger   |         	|MANUAL       |
					|objSlug      |         	|CG: NAME  \\test name \\test designationAUTO: IN AT: 00:00'00 (MANUAL)|
					And I paste object in ENPS
					And I check in ENPS to verify "cg" object
					And I close all scripts
					And "CG" section open in "West1"
				}
				sleep (1)
	    	end

	    	if (cgcode == "NEWS LOCATOR LEFT")
	    		steps %Q{
	    			 And I click "50" pixels to the "bottom" of "cgselectlive.png"
	    			 And I click "30" pixels to the "bottom" of "cglocation.png"
		 			 And I type "test LOCATION Case"
		 			 And I use RETURN
	    		}
	    	end

    end
  rescue
		puts "I check Template for each CG code for #{style} has failed"
  end

end

##################################################################################################################
### This is the code that runs a loop through all the values stored under STORYBRAND (*ONLY) in config.yml
### It will loop through all the selection under STORYBRAND and compare each image in preview against the expected image
### By adding or remove values under STORYBRAND in config.yml, you will increase the number of array or reduce
##################################################################################################################

Then (/^I check story brand image under NEWS$/) do
  begin
			index = 0
		$config["West1"]["cgstyles"]["STORYBRAND"].each do |storybrands|
			image = storybrands["image"]
			cgcodekey = storybrands["cgcodekey"]
			imgkey = storybrands["imgkey"]
			puts storybrands

			if(index == 0)
				step 'I click "80" pixels to the "right" of "cgcode.png"'
				step 'I use Home'
				step 'I use RETURN'
					cgcodekey.to_i.times do
		    			@screen.type(Sikuli::DOWNARROW)
		    			sleep(0.3)
		    		end
		    	sleep (2)
	    	end
	    	step 'I click "50" pixels to the "bottom" of "selectstrandimage.png"'
			step 'I use Home'
			step 'I use RETURN'
				imgkey.to_i.times do
	    			@screen.type(Sikuli::DOWNARROW)
	    			sleep(0.3)
	    		end
	    	sleep (2)
	    	step 'I should see "'+image+'" with high accuracy "0.87"'
	    	index = 1
    end
  rescue
		puts "I check story brand image under NEWS has failed"
  end

end

##################################################################################################################
### This is the code that runs a loop through all values stored under cgstyles in config.yml
### It fetches the given Style and CG code to return the number of times downarrow is used and the expected template image
### By adding or remove entries under cgstyles in config.yml, you will increase the number of array or reduce
##################################################################################################################
Given (/^I select Style "(.*?)" and CG code "(.*?)"$/) do |style, cgcodeform|
  begin
		step 'I click on "cgclear.png"'
		$config["West1"]["cgstyles"][style].each do |styles| #Starts of the loop
			puts styles
			if (styles["cgcode"]== cgcodeform) #check if cgcode in yaml matches the given cgcode in feature and pass it as the argument
				cgcode = styles["cgcode"]
				image = styles["image"]
				image1 = styles["image1"]
				image2 = styles["image2"]
				typekey = styles["typekey"]
				cgcodekey = styles["cgcodekey"]


				step 'I click "80" pixels to the "right" of "cgstyle.png"'
				step 'I use Home'
				step 'I use RETURN'
						typekey.to_i.times do
			    			@screen.type(Sikuli::DOWNARROW)
			    			sleep(0.3)
			    		end
			    	sleep (2)
		    	puts "Found Style!!"
		    	step 'I click "80" pixels to the "right" of "cgcode.png"'
				step 'I use Home'
				step 'I use RETURN'
					cgcodekey.to_i.times do
		    			@screen.type(Sikuli::DOWNARROW)
		    			sleep(0.3)
		    		end
		    	puts "Found CG Code!!"
		    	sleep (2)
		    	step 'I should see "'+image+'" with high accuracy "0.87"'
					puts "Found image!!"
		    	break
		  	end
    end
  rescue
  	puts "I select Style #{style} and CG code #{cgcodeform} has failed"
  end

end

#####################################################################################################################################################
#### This is the code to perform the action when a selected style and cgcode is defined in the feature.
#### each field is listed below, if you are adding a new template to be included as part of the test you
### will need to add it to the ymal and add the field that you wish to perform text input here.
#####################################################################################################################################################

When (/^I input text in field "(.*?)" in "(.*?)" case$/) do |cgfield, textcase|
  begin
		if (cgfield == "Name")
			steps %Q{
				And I click "50" pixels to the "bottom" of "newsnamename.png"
					And I type "#{$testname}"
					And I use RETURN
			}
		elsif (cgfield == "Designation")
			steps %Q{
				And I click "50" pixels to the "bottom" of "newsnamedesignation.png"
					And I type "#{$testdes}"
					And I use RETURN
			}
		elsif (cgfield == "Location")
			steps %Q{
			 And I click "50" pixels to the "bottom" of "cglocation.png"
			 And I type "#{$tetloc}"
			 And I use RETURN
			}
		elsif (cgfield == "Timeoffset")
			steps %Q{
			 And I click "50" pixels to the "bottom" of "cgtimeoffset.png"
			 And I type "#{$testtime}"
			 And I use RETURN
			}
		elsif (cgfield == "Freetext")
			steps %Q{
			 And I click "50" pixels to the "bottom" of "cgfreetext.png"
			 And I type "#{$testfree}"
			 And I use RETURN
			}
		elsif (cgfield == "Tabtext")
			steps %Q{
			 And I click "50" pixels to the "bottom" of "cgtabtext.png"
			 And I type "#{$testtab}"
			 And I use RETURN
			}
		elsif (cgfield == "Straptext")
			steps %Q{
			 And I click "50" pixels to the "bottom" of "cgstraptext.png"
			 And I type "#{$teststrap}"
			 And I use RETURN
			}
		elsif (cgfield == "Ticker Content")
			steps %Q{
				And I click "50" pixels to the "bottom" of "cgtickercontent.png"
					And I type "#{$testtick}"
					And I use RETURN
			}
		elsif (cgfield == "Designation Abbr")
			steps %Q{
				And I click "50" pixels to the "bottom" of "newsnamedesignation.png"
					And I type "#{$testlabcon}"
					And I use RETURN
			}
		elsif (cgfield == "Ticker Content Edit")
			steps %Q{
				And I click on "cgclear.png"
				And I click "50" pixels to the "bottom" of "cgtickercontent.png"
					And I type "#{$testeditcg}"
					And I use RETURN
			}
		elsif (cgfield == "Picture Credit 1")
			steps %Q{
				And I click on "cgclear.png"
				And I click "50" pixels to the "bottom" of "picturecredit1.png"
					And I type "#{$testcombo}"
					And I use RETURN
			}
		elsif (cgfield == "Picture Credit 2")
			steps %Q{
				And I click on "cgclear.png"
				And I click "50" pixels to the "bottom" of "picturecredit2.png"
					And I type "#{$testcombo}"
					And I use RETURN
			}
		end

		if (textcase == "LOWER")
			steps %Q{
				And I use TAB "2" times
				And I press the space key
			}
		elsif (textcase == "UPPER")
			steps %Q{
				And I use TAB
				And I press the space key
			}
		elsif (textcase == "TITLE")
			steps %Q{
				And I use TAB "3" times
				And I press the space key
			}
		elsif (textcase == "NONE")
			puts "No Case change specified!!"
		end
  rescue
    puts "I input text in field #{cgfield} in #{textcase} case has failed"
  end
end


When (/^I select "(.*?)" dropdown with "(.*?)"$/) do |cgfield, dropdownsel|
  begin
		if (cgfield == "Picture Credit 1")
			steps %Q{
				And Within region "picturecredit1region.png" click "dropdownarrow.png"
				}
		elsif (cgfield == "Picture Credit 2")
			steps %Q{
				And Within region "picturecredit2region.png" click "dropdownarrow.png"
			}
		end

		if (dropdownsel == "Recent pictures")
			steps %Q{
				And I use the DOWNARROW "2" times
				And I use RETURN
			}
		elsif (dropdownsel == "Sky sport")
			steps %Q{
				And I use the DOWNARROW "2" times
				And I use RETURN
			}
		elsif (dropdownsel == "ITV sport")
			steps %Q{
				And I use the DOWNARROW "3" times
				And I use RETURN
			}
		elsif (dropdownsel == "BBC sport")
			steps %Q{
				And I use the DOWNARROW "3" times
				And I use RETURN
			}
		end
  rescue
  	puts "I select #{cgfield} dropdown with #{dropdownsel} has failed"
  end

end

When (/^I input accents in field "(.*?)" in "(.*?)" case$/) do |cgfield, textcases|
	begin

		if !(@screen.exists "accentsinputgrid.png")
			step 'I click on "cgaccesnt.png"'
			step 'I should see "accentsinputgrid.png" with high accuracy "0.70"'
		else
			puts "Accent grid already selected"
		end

		if (cgfield == "Name")
				steps %Q{
					And I click "50" pixels to the "bottom" of "newsnamename.png"
				}
			elsif (cgfield == "Timeoffset")
				steps %Q{
				 And I click "50" pixels to the "bottom" of "cgtimeoffset.png"
				}
			elsif (cgfield == "Freetext")
				steps %Q{
				 And I click "50" pixels to the "bottom" of "cgfreetext.png"
				}
			elsif (cgfield == "Location")
			steps %Q{
			 And I click "50" pixels to the "bottom" of "cglocation.png"
			}
			end

		if (textcases == "LOWER")
			puts "i am here!"
			if (@screen.exists "loweraccents.png")
				step 'I click on "loweraccents.png"'
				puts "Lower case selected"
			elsif (@screen.exists "loweraccentshl.png")
				puts "Lower case already selected"
			end
			steps %Q{
			And I click on "a.png"
			And I can see "#{$accentlowerAarray}" and click to insert accent
			And I click on "e.png"
			And I can see "#{$accentlowerEarray}" and click to insert accent
			And I click on "i.png"
			And I can see "#{$accentlowerIarray}" and click to insert accent
			And I click on "o.png"
			And I can see "#{$accentlowerOarray}" and click to insert accent
			And I click on "u.png"
			And I can see "#{$accentlowerUarray}" and click to insert accent
			And I click on "y.png"
			And I can see "#{$accentlowerYarray}" and click to insert accent
			And I click on "c.png"
			And I can see "#{$accentlowerCarray}" and click to insert accent
			And I click on "s.png"
			And I can see "#{$accentlowerSarray}" and click to insert accent
			And I click on "n.png"
			And I can see "#{$accentlowerNarray}" and click to insert accent
			And I click on "w.png"
			And I click on "w1.png"
			And I click on "cginsert.png"
			}
		elsif (textcases == "UPPER")
			if (@screen.exists "upperaccents.png")
				step 'I click on "upperaccents.png"'
				puts "Upper case selected"
			elsif (@screen.exists "upperaccentshl.png")
				puts "Upper case already selected"
			end
			steps %Q{
			And I click on "UA.png"
			And I can see "#{$accentUpperAarray}" and click to insert accent
			And I click on "UE.png"
			And I can see "#{$accentUpperEarray}" and click to insert accent
			And I click on "UI.png"
			And I can see "#{$accentUpperIarray}" and click to insert accent
			And I click on "UO.png"
			And I can see "#{$accentUpperOarray}" and click to insert accent
			And I click on "UU.png"
			And I can see "#{$accentUpperUarray}" and click to insert accent
			And I click on "UY.png"
			And I can see "#{$accentUpperYarray}" and click to insert accent
			And I click on "UC.png"
			And I can see "#{$accentUpperCarray}" and click to insert accent
			And I click on "US.png"
			And I can see "#{$accentUpperSarray}" and click to insert accent
			And I click on "UN.png"
			And I can see "#{$accentUpperNarray}" and click to insert accent
			And I click on "UW.png"
			And I click on "UW1.png"
			And I click on "cginsert.png"
			}
		elsif (textcases == "DEGREES")
			if (@screen.exists "degreeaccents.png")
				step 'I click on "degreeaccents.png"'
				puts "DEGREES selected"
			elsif (@screen.exists "degreeaccentshl.png")
				puts "DEGREES already selected"
			end
			step 'I should see "degree.png" with high accuracy "0.87"'
			step 'I click on "cginsert.png"'
		elsif (textcases == "EURO")
			if (@screen.exists "euroaccents.png")
				step 'I click on "euroaccents.png"'
				puts "EURO selected"
			elsif (@screen.exists "euroaccentshl.png")
				puts "EURO already selected"
			end
			step 'I should see "euro.png" with high accuracy "0.87"'
			step 'I click on "cginsert.png"'
		end

  rescue
  	puts "I input accents in field #{cgfield} in #{textcases} case has failed"
  end
end
##################################################################################################################

When (/^I Select Name from Database$/) do
  begin
	steps %Q{
		And I click on "cgnamedb.png"
		And I type "THERESA MAY"
		And I use Down
		And I can see "#{$cgdbtestarray}"
		And I use RETURN
		}
  rescue
    puts "I Select Name from Database has failed"
  end
end

When (/^I check for abbreviation "(.*?)"$/) do |num|
	begin
		steps %Q{
			And I click "50" pixels to the "bottom" of "newsnamedesignation.png"
			And I use TAB "4" times
			And I use SPACE "#{num}" times
			}
  rescue
    puts "I check for abbreviation #{num} has failed"
  end
end

When (/^I undo abbreviation$/) do
  begin
		steps %Q{
			And I click "50" pixels to the "bottom" of "newsnamedesignation.png"
			And I use TAB "5" times
			And I press the space key
		}
  rescue
		puts "I undo abbreviation has failed"
  end
end

Then (/^I clear CG form$/) do
	begin
			step 'I click on "cgclear.png"'
  rescue
    puts "I clear CG form has failed"
  end
end

Then (/^I check CG form is cleared$/) do
  begin
		step 'I should see either "clearedfield.png" or "clearcombobox.png"'
  rescue
    puts "I check CG form is cleared has fialed"
  end
end

##################################################################################################################

When (/^I set CG timming to "(.*?)"$/) do |timming|
  begin
		step 'I click "50" pixels to the "bottom" of "cgtimmingauto.png"'
		step 'I use Home'
			if (timming == "AUTOMATIC")
				steps %Q{
					And I use Down
					And I use RETURN
					And I can see "#{$cgautotimmingarray}"

				}
			elsif (timming == "AUTO K/W BGND")
				steps %Q{
					And I use the DOWNARROW "2" times
					And I use RETURN
					And I should see "cgintime.png" with high accuracy "0.87"
				}
			elsif (timming == "AUTO K/W STORY")
				steps %Q{
					And I use the DOWNARROW "3" times
					And I use RETURN
					And I should see "cgintime.png" with high accuracy "0.87"
				}
			elsif (timming == "AUTO NO OUT")#
				steps %Q{
					And I use the DOWNARROW "4" times
					And I use RETURN
					And I should see "cgintime.png" with high accuracy "0.87"
				}
			elsif (timming == "MANUAL")
				steps %Q{
					And I use Home
					And I use RETURN
					And I should see "cgtimmingmanual.png" with high accuracy "0.87"
				}
      end
  rescue
    puts "I set CG timming to #{timming}"
  end
end
