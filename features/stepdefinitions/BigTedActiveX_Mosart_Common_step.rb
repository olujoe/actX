#####################################################################################################################################################
##### This is the step definition that drives the action of MOSART test cases#####
##### Author: Brian Tsang
#####################################################################################################################################################

##################################################################################################################

##################################################################################################################
### This is the code that runs a loop through all the values stored in config.yml
### The argument you pass in the feature file is the style you have chosen to run, it will go through each cgcode specified in confing.yml
### By adding or remove values in config.yml, you will increase the number of array or reduce

### You are able to specify specifc steps you wish to run when the loop is selecting a combination through the dropdown
### For instance, if (cgcode == NEWS NAME) in Style News, MOSART code Name, within the loop 
### it will enter some value and copy the item to ENPS and checks for validation
### You can added different steps you wish to perform for another CG code
##################################################################################################################
Then (/^I select Template for each SET for "(.*?)"$/) do |set|
  begin
		index = 0
		$config["West1"]["mosartset"][set].each do |sets|
			template = sets["template"]
				image1 = sets["image1"]
				image2 = sets["image2"]
				image3 = sets["image3"]
				image4 = sets["image4"]
			setkey = sets["setkey"]
			templatekey = sets["templatekey"]
			puts sets

			if(index == 0)
				step 'I click "80" pixels to the "right" of "mosartset.png"'
				step 'I use Home'
				step 'I use RETURN'
					setkey.to_i.times do 
		    			@screen.type(Sikuli::DOWNARROW)
		    			sleep(0.3)
		    		end
		    	sleep (2)
	    	end
	    	step 'I click "50" pixels to the "bottom" of "mosarttemplate.png"'
			step 'I use Home'
			step 'I use RETURN'
				templatekey.to_i.times do 
	    			@screen.type(Sikuli::DOWNARROW)
	    			sleep(0.3)
	    		end
	    	sleep (2)
	    	step 'I should see "'+image3+'" with high accuracy "0.79"'
	    	step 'I should see "'+image4+'" with high accuracy "0.79"'
	    	index = 1

	    	if (templatekey == "NEWS NAME")

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
					And "CG" section open in "BigTedW1"
				}
				sleep (1)
	    	end

	    	if (templatekey == "NEWS LOCATOR LEFT")
	    		steps %Q{
	    			 And I click "50" pixels to the "bottom" of "cgselectlive.png"
	    			 And I click "30" pixels to the "bottom" of "cglocation.png"
		 			 And I type "test LOCATION Case"
		 			 And I use RETURN
	    		}
	    	end
	    				
    end
  rescue
    puts "I select Template for each SET for #{set} has Failed"
  end

end

##################################################################################################################
When (/^I assign Set "([^"]*)" as HomeSet$/) do |set|
  begin
		$config["West1"]["mosartset"].each do |sets| #Starts of the loop
			if (sets[0]==set)
				#puts "yes"
					sets[1].each do |checksetkey|
						template = checksetkey["template"]
								image1 = checksetkey["image1"]
								image2 = checksetkey["image2"]
								image3 = checksetkey["image3"]
								image4 = checksetkey["image4"]
								setkey = checksetkey["setkey"]
								templatekey = checksetkey["templatekey"]
						step 'I click "80" pixels to the "right" of "mosartset.png"'
						step 'I use Home'
						step 'I use RETURN'
								setkey.to_i.times do 
					    			@screen.type(Sikuli::DOWNARROW)
					    			sleep(0.3)
					    		end
					    	sleep (2)
				    	puts "Found Set!!"
				    	sleep (2)
				    	step 'I should see either "'+image1+'" or "'+image2+'"'
				    	step 'I click on "makethismyhomeset.png"'
				    	break
					end
			end
    end
  rescue
    puts "I assign Set #{set} as HomeSet has Failed"
  end

end

Then (/^I check my HomeSet is Set "([^"]*)"$/) do |set|
  begin
		$config["West1"]["mosartset"].each do |sets| #Starts of the loop
			if (sets[0]==set)
				puts "yes"
				puts sets
					sets[1].each do |checksetkey|
						template = checksetkey["template"]
								image1 = checksetkey["image1"]
								image2 = checksetkey["image2"]
								image3 = checksetkey["image3"]
								image4 = checksetkey["image4"]
								setkey = checksetkey["setkey"]
								templatekey = checksetkey["templatekey"]
					step 'I click "80" pixels to the "right" of "mosartset.png"'
			    	step 'I use End'
			    	step 'I use RETURN'
			    	step 'I click on "usehomeset.png"'
			    	step 'I should see either "'+image1+'" or "'+image2+'"'
			    	break
		    		end
		  	end
    end
  rescue
    puts "I check my HomeSet #{set} has Failed"
  end

end

##################################################################################################################

Given (/^I select Set "(.*?)" and Template "(.*?)"$/) do |set, template|
  begin
		$config["West1"]["mosartset"].each do |sets| #Starts of the loop
			#puts sets
			if (sets[0]==set)
				#puts "yes"
					sets[1].each do |eachtemplate|
					#puts eachtemplate
					#puts eachtemplate["template"]
							if (eachtemplate["template"].to_s== template.to_s)
								template = eachtemplate["template"]
								image1 = eachtemplate["image1"]
								image2 = eachtemplate["image2"]
								image3 = eachtemplate["image3"]
								image4 = eachtemplate["image4"]
								setkey = eachtemplate["setkey"]
								templatekey = eachtemplate["templatekey"]
								


								step 'I click "80" pixels to the "right" of "mosartset.png"'
								step 'I use Home'
								step 'I use RETURN'
										setkey.to_i.times do 
							    			@screen.type(Sikuli::DOWNARROW)
							    			sleep(0.3)
							    		end
							    sleep (2)
							    step 'I should see either "'+image1+'" or "'+image2+'"'
						    	puts "Found Set!!"
						    	step 'I click "50" pixels to the "bottom" of "mosarttemplate.png"'
								step 'I use Home'
								step 'I use RETURN'
									templatekey.to_i.times do 
						    			@screen.type(Sikuli::DOWNARROW)
						    			sleep(0.3)
						    		end
						    	puts "Found Template!!"
						    	sleep (2)
						    	step 'I should see "'+image3+'" with high accuracy "0.78"'
						    	step 'I should see "'+image4+'" with high accuracy "0.78"'
						    	break
					  		end
					end
			end
    end
  rescue
    puts "I select Set #{set} and Template #{template} has Failed"
  end

end

##################################################################################################################

When (/^I select variant "(.*?)"$/) do |variant|
  begin
	step 'I click "50" pixels to the "bottom" of "variant.png"'
	step 'I use Home'
	step 'I use RETURN'
		variant.to_i.times do 
			@screen.type(Sikuli::DOWNARROW)
    			sleep(0.3)
    end
  rescue
    puts "I select variant #{variant} has Failed"
  end

 end

 When (/^I set mosart transition "(.*?)"$/) do |transition|
   begin
		step 'I click "50" pixels to the "bottom" of "transition.png"'
		step 'I use Home'
		step 'I use RETURN'
			if (transition == "DEFAULT")
			step 'I use Home'
			elsif (transition == "MIX")
				step 'I use Down'
			elsif (transition == "WIPE")
				step 'I use the DOWNARROW "2" times'
			elsif (transition == "EFFECT")
				step 'I use End'
      end
   rescue
     puts "I set mosart transition #{transition} has Failed"
   end

 end

 When (/^I set "(.*?)" frames$/) do |frames|
   begin
		step 'I click "50" pixels to the "bottom" of "frames.png"'
		step 'I use the BACKSPACE "5" times'
		step 'I type "'+frames+'"'
   rescue
 		puts "I set #{frames} frames has Failed"
   end

 end
 
 When (/^I set effect "(.*?)"$/) do |effect|
	begin
		step 'I click "50" pixels to the "bottom" of "effect.png"'
		step 'I use Home'
		step 'I use RETURN'
			effect.to_i.times do
				@screen.type(Sikuli::DOWNARROW)
						sleep(0.3)
      end
  rescue
    puts "I set effect #{effect} has Failed"
  end

 end

 When (/^I select occurs at "(.*?)"$/) do |occurs|
 	begin
		 sleep(3)
		if (occurs.downcase == "relative to start")
			step 'I click "50" pixels to the "bottomright" of "occursat.png"'
			step 'I use Home'
			step 'I use RETURN'
		elsif (occurs.downcase == "absolute time of day")
			step 'I click "50" pixels to the "bottomright" of "occursat.png"'
			step 'I use End'
			step 'I use RETURN'
		else
			fail "No selection avaliable!"
    end
  rescue
    puts "I select occurs at #{occurs} has Failed"
  end

 end

 When (/^I select "(.*?)" from "(.*?)" in addtional parameters$/) do |option, parameters|
	begin
		if (parameters.downcase == "os")
			step 'I click "50" pixels to the "bottom" of "os.png"'
			step 'I use Home'
			option.to_i.times do
				@screen.type(Sikuli::DOWNARROW)
						sleep(0.3)
					end
			elsif (parameters.downcase == "camera")
				step 'I click "50" pixels to the "bottom" of "camera.png"'
				step 'I use Home'
			option.to_i.times do
				@screen.type(Sikuli::DOWNARROW)
						sleep(0.3)
					end
		end
  rescue
    puts "I select #{option} from #{parameters} in addtional parameters has Failed"
  end

 end