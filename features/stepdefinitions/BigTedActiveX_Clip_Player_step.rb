
#####################################################################################################################################################
##### This is the step definition that drives the action of Clip Player  test cases#####
##### Author: Brian Tsang
#####################################################################################################################################################

When (/^I start playback "(.*?)"$/) do |play|
  begin
	case play.downcase
		when "clipname1"
			#startframe = "1stframeclip1.png"
			startframe = $startframeA
			#cliptitle = "VDOD/ANOREXIC/1021/20/7"
			cliptitle = $clipA
		when "clipname2"
			#startframe = "1stframeclip2.png"
			startframe = $startframeB
			#cliptitle = "SYRIAMEDIA/ALK/0500/28/2"
			cliptitle = $clipB
		when "clipname3"
			#startframe = "1stframeclip3.png"
			startframe = $startframeC
			#cliptitle = "LOCKERBIE/CAMPBELL/1200/23/8"
			cliptitle = $clipC
		when "clipname4"
			#startframe = "1stframeclip4.png"
			startframe = $startframeD
			#cliptitle = "SUMMER/SHUKMAN/2200/29/7"
			cliptitle = $clipD
	else
		fail("Clip/Frame not found!")
	end
		if play.downcase ==  "clipname1"
			if (@screen.exists startframe)
				puts "#{cliptitle} loaded"
			else
				fail("Clip Failed to load!")
			end
		end
		if play.downcase ==  "clipname2"
			if (@screen.exists startframe)
				puts "#{cliptitle} loaded"
			else
				fail("Clip Failed to load!")
			end
		end
		if play.downcase ==  "clipname3"
			if (@screen.exists startframe)
				puts "#{cliptitle} loaded"
			else
				fail("Clip Failed to load!")
			end
		end
		if play.downcase ==  "clipname4"
			if (@screen.exists startframe)
				puts "#{cliptitle} loaded"
			else
				fail("Clip Failed to load!")
			end
		end
	step 'I should see either "play.png" or "play2.png"'
	step 'I click on "play2.png"'
	step 'I should see either "pause.png" or "pause2.png"'
  rescue
    puts "I start playback #{play} has Failed"
  end

end

Then (/^clip "(.*?)" plays$/) do |checkplay|
  begin
	case checkplay.downcase
		when "clipname1"
			startframe = "1stframeclip1.png"
			#cliptitle = "VDOD/ANOREXIC/1021/20/7"
			cliptitle = $clipA
		when "clipname2"
			startframe = "1stframeclip2.png"
			#cliptitle = "SYRIAMEDIA/ALK/0500/28/2"
			cliptitle = $clipB
		when "clipname3"
			startframe = "1stframeclip3.png"
			#cliptitle = "LOCKERBIE/CAMPBELL/1200/23/8"
			cliptitle = $clipC
		when "clipname4"
			startframe = "1stframeclip4.png"
			#cliptitle = "SUMMER/SHUKMAN/2200/29/7"
			cliptitle = $clipD
	else
		fail("Clip/Frame not found!")
	end
	sleep (10)
	step 'I should see either "pause.png" or "pause2.png"'
		if checkplay.downcase ==  "clipname1"
			if !(@screen.exists startframe)
				puts "#{cliptitle} is currently playing"
			else
				fail("Failed to play!")
			end
		end
		if checkplay.downcase ==  "clipname2"
			if !(@screen.exists startframe)
				puts "#{cliptitle} is currently playing"
			else
				fail("Failed to play!")
			end
		end
		if checkplay.downcase ==  "clipname3"
			if !(@screen.exists startframe)
				puts "#{cliptitle} is currently playing"
			else
				fail("Failed to play!")
			end
		end
		if checkplay.downcase ==  "clipname4"
			if !(@screen.exists startframe)
				puts "#{cliptitle} is currently playing"
			else
				fail("Failed to play!")
			end
    end
  rescue
    put "clip #{checkplay} plays had Failed"
  end

end

When (/^I pause playback$/) do
	begin
	steps %Q{
		And I should see either "pause.png" or "pause2.png"
		And I press the space key
		And I should see either "play.png" or "play2.png"
	}
  rescue
    puts "I pause playback has Failed"
  end

end

Then (/^clip stops$/) do
  begin
	steps %Q{
		And I should see either "play.png" or "play2.png"
	}
  rescue
    puts "clip stops has Failed"
  end

end

When (/^I mute audio$/) do
  begin
	if (@screen.exists "play.png") || (@screen.exists "play2.png")
		steps %Q{
			And I should see either "sound.png" or "sound2.png"
			And I click on "play.png"
			And I click on "sound.png"
			And I should see either "mute.png" or "mute2.png"
		} 
	elsif (@screen.exists "pause.png") || (@screen.exists "pause2.png")
		steps %Q{
			And I should see either "sound.png" or "sound2.png"
			And I click on "sound.png"
			And I should see either "mute.png" or "mute2.png"
		}
	else
		fail("ERROR! RUN FAILED")
	end
	puts "Clip play back with audio muted, please check!"
  rescue
    puts "I mute audio has Failed"
  end
end

Then (/^audio is muted$/) do
  begin
	if !(@screen.exists "mute.png")
		fail("Audio is not mute!")
	else
		steps %Q{
			And I wait for "10" seconds
			And I click on "pause.png"
		}
  end
  rescue
    puts "audio is muted has Failed"
  end
end

When (/^I unmute audio$/) do
  begin
	if (@screen.exists "play.png") || (@screen.exists "play2.png")
		steps %Q{
			And I should see either "mute.png" or "mute2.png"
			And I click on "play.png"
			And I click on "mute.png"
			And I should see either "sound.png" or "sound2.png"
		} 
	elsif (@screen.exists "pause.png") || (@screen.exists "pause2.png")
		steps %Q{
			And I should see either "mute.png" or "mute2.png"
			And I click on "mute.png"
			And I should see either "sound.png" or "sound2.png"
		}
	else
		fail("ERROR! RUN FAILED")
	end
	puts "Clip play back with audio, please check!"
  rescue
    puts "I unmute audio has Failed"
  end

end

Then (/^audio is unmute$/) do
  begin
	if !(@screen.exists "sound.png")
		fail("Audio remains muted!")
	else
		steps %Q{
			And I wait for "10" seconds
			And I click on "pause.png"
		}
  end
  rescue
    puts "audio is unmute has Failed"
  end

end

When (/^I scrub "(.*?)" on "(.*?)"$/) do |direction,checktitle|
  begin
	case direction.downcase
		when"forward"
			scrubforward = "setcgin.png"
			scrubforwardend = "scrubforwardend.png"
		when "backward"	
			scrubback = "sound.png"
			scrubbackend = "scrubbackend.png"
	else
		fail("No direction declared!")
	end
	case checktitle.downcase
		when "clipname1"
			startframe = "1stframeclip1.png"
			cliptitleimage = $cliptitleimageA
			cliptitle = $clipA
		when "clipname2"
			startframe = "1stframeclip2.png"
			cliptitleimage = $cliptitleimageB
			cliptitle = $clipB
		when "clipname3"
			startframe = "1stframeclip3.png"
			cliptitleimage = $cliptitleimageC
			cliptitle = $clipC
		when "clipname4"
			startframe = "1stframeclip4.png"
			cliptitleimage = $cliptitleimageD
			cliptitle = $clipD
	else
		fail("Clip/Frame not found!")
	end
	if checktitle.downcase ==  "clipname1" and direction.downcase == "forward"
		if (@screen.exists cliptitleimage) and (@screen.exists "play.png") 
			step 'I click "20" pixels to the "top" of "'+scrubforward+'"'
			step 'I click "200" pixels to the "right" of "'+scrubforward+'"'
			step 'I should see "'+scrubforwardend+'" with high accuracy "0.87"'
		end
	
	elsif checktitle.downcase ==  "clipname1" and direction.downcase == "backward"
		if (@screen.exists cliptitleimage) and (@screen.exists "play.png") 
			step 'I click "35" pixels to the "top" of "'+scrubback+'"'
			step 'I should see "'+scrubbackend+'" with high accuracy "0.87"'
		end
	
	elsif checktitle.downcase ==  "clipname2" and direction.downcase == "forward"
		if (@screen.exists cliptitleimage) and (@screen.exists "play.png") 
			step 'I click "20" pixels to the "top" of "'+scrubforward+'"'
			step 'I should see "'+scrubforwardend+'" with high accuracy "0.87"'
		end
	elsif checktitle.downcase ==  "clipname2" and direction.downcase == "backward"
		if (@screen.exists cliptitleimage) and (@screen.exists "play.png") 
			step 'I click "35" pixels to the "top" of "'+scrubback+'"'
			step 'I should see "'+scrubbackend+'" with high accuracy "0.87"'
		end
	elsif checktitle.downcase ==  "clipname3" and direction.downcase == "forward"
		if (@screen.exists cliptitleimage) and (@screen.exists "play.png") 
			step 'I click "20" pixels to the "top" of "'+scrubforward+'"'
			step 'I should see "'+scrubforwardend+'" with high accuracy "0.87"'
		end
	elsif checktitle.downcase ==  "clipname3" and direction.downcase == "backward"
		if (@screen.exists cliptitleimage) and (@screen.exists "play.png") 
			step 'I click "35" pixels to the "top" of "'+scrubback+'"'
			step 'I should see "'+scrubbackend+'" with high accuracy "0.87"'
		end
	elsif checktitle.downcase ==  "clipname4" and direction.downcase == "forward"
		if (@screen.exists cliptitleimage) and (@screen.exists "play.png") 
			step 'I click "20" pixels to the "top" of "'+scrubforward+'"'
			step 'I should see "'+scrubforwardend+'" with high accuracy "0.87"'
		end
	elsif checktitle.downcase ==  "clipname4" and direction.downcase == "backward"
		if (@screen.exists cliptitleimage) and (@screen.exists "play.png") 
			step 'I click "35" pixels to the "top" of "'+scrubback+'"'
			step 'I should see "'+scrubbackend+'" with high accuracy "0.87"'
		end
	else
		 
		 fail("ERROR! You need to kick off test @C653373 @C653374 and @C653375")
		
  end
  rescue
    puts "I scrub #{direction} on #{checktitle} has Failed"
  end

end

Then (/^clip plays from selected segment$/) do
  begin
	puts "clip is playing from selected point"
	steps %Q{
				And I click on "play.png"
				And I wait "5" seconds
				And I click on "pause.png"
			}
  rescue
    puts "clip plays from selected segment has Failed"
  end

end
