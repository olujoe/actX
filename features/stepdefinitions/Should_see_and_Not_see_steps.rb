
#Then (/^I can see "([^"]*)"$/) do |array|
Then (/^I can see "(.*?)"$/) do |array|
	begin
	exists = false
	value = array.split(",")
	value.each do |eachimage|
		if @screen.exists eachimage
			exists = true
			puts "Found image - #{eachimage}"
			break
		end
	end
	if !exists
		fail ("Did not find Image!!! #{array}")
  end
  rescue
    puts "I can see #{array} has Failed"
  end
end


Then (/^I can see "(.*?)" and doubleclick$/) do |array|
	begin
  exists = false
	value = array.split(",")
	value.each do |eachimage|
		if @screen.exists eachimage
			exists = true
			#step 'I click "15" pixels to the "right" of "'+eachimage+'"'
			sleep (0.2)
			step 'I doubleclick on "'+eachimage+'" until "'+eachimage+'" disappears'
			break
			puts "Found image - #{eachimage}"
			#@screen.doubleClick eachimage
		end
	end
	if !exists
		fail ("Did not find Image!!! #{array}")
  end
  rescue
    puts "I can see #{array} and doubleclick"
  end
end


Then (/^I can see "(.*?)" and click to insert accent$/) do |array|
	begin
  exists = false
	value = array.split(",")
	value.each do |eachimage|
		if @screen.exists eachimage
			exists = true
			#step 'I click "15" pixels to the "right" of "'+eachimage+'"'
			sleep (0.2)
			step 'I click on "'+eachimage+'"'
			step 'I click on "cginsert.png"'
			puts "Found image - #{eachimage}"
			#@screen.doubleClick eachimage
		end
	end
	if !exists
		fail ("Did not find Image!!! #{array}")
  end
  rescue
    puts "I can see #{array} and click to inseart accent has Failed"
  end
end

Then /^I should see either "(.*?)" or "(.*?)"$/ do |bitmap, bitmap2|
	begin
	controlParameter =""
	waitingOver = 2
	nearly_not_quite = false
	timeout = 0

    puts "Locate Bitmap " + bitmap + " or " + bitmap2
    begin

		if @screen.exists "#{bitmap}", 2
			@region = @screen.exists "#{bitmap}"
			puts @region.getScore()
			# the assertion has to be almost spot on

			if @region.getScore() > BITMAPTOLERANCELEVEL_FOR_ASSERTION
				if controlParameter.include? "noHighlight"
					# do nothing - Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
				else
					#@region.highlight(1)
				end
			else
				nearly_not_quite = true
				fail("Throw Exception - Force Rescue Block")
			end
		else
			if @screen.exists "#{bitmap2}", 2
				@region = @screen.exists "#{bitmap2}"
				puts @region.getScore()
				if @region.getScore() > BITMAPTOLERANCELEVEL_FOR_ASSERTION
					if controlParameter.include? "noHighlight"
						# do nothing - Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
					else
						#@region.highlight(1)
					end
				else
					nearly_not_quite = true
					fail("Throw Exception - Force Rescue Block")
				end
			else
				fail("didnt find either image")
			end
		end

	rescue
		if(ENV['debug'])
			puts "Rescuing - " + timeout.to_s
		end
		if timeout == waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
		end

		if nearly_not_quite == true
			fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL_FOR_ASSERTION.to_s + " - Score = " + @region.getScore().to_s)
		end

		timeout += 2
		retry
	end
  rescue
    puts "I should see either #{bitmap} or #{bitmap2} has Failed"
  end
end


Then /^I should see "(.*?)"$/ do |bitmap|
	begin
	#puts "NH = " +controlParameter

	# allow user to specify how long to wait
	waitingTime = "soon"
	waitingOver = calculate_wait(waitingTime)

	nearly_not_quite = false
	timeout = 0
	begin
		if(ENV['debug'])
	    	puts "Locate Bitmap " + bitmap
	    end
		if @screen.exists "#{bitmap}"
			@region = @screen.exists "#{bitmap}"
			if(ENV['debug'])
				puts @region.getScore()
			end

			# the assertion has to be almost spot on

			if @region.getScore() > BITMAPTOLERANCELEVEL_FOR_ASSERTION
				if controlParameter.include? "noHighlight"
					# do nothing - Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
				else
					if(ENV['debug'])
						@region.highlight(1)
					end
				end
			else
				nearly_not_quite = true
				fail("Throw Exception - Force Rescue Block")
			end
		else
			fail("Throw Exception - Force Rescue Block")
		end

	rescue
		sleep(1)
		if(ENV['debug'])
			puts "Rescuing - " + timeout.to_s
		end
		if timeout == waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
		end

		if nearly_not_quite == true
			fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL_FOR_ASSERTION.to_s + " - Score = " + @region.getScore().to_s)
		end

		timeout += 5
		retry
  end
  rescue
    puts "I should see #{bitmap} has Failed"
  end
end


Then /^I should see "(.*?)" with high accuracy "(.*?)"(.*)$/ do |bitmap, accuracy, controlParameter|
	begin
	#puts "NH = " +controlParameter
	new_BITMAPTOLERANCELEVEL_FOR_ASSERTION = accuracy.to_f
	# allow user to specify how long to wait
	waitingTime = ""
	if controlParameter.include? "soon"
	   waitingTime = "soon"
	elsif controlParameter.include? "eventually"
	   waitingTime = "eventually"
	end
	waitingOver = calculate_wait(waitingTime)

	if controlParameter.include? "nowait"
		waitingOver = 0
	end
	nearly_not_quite = false
	timeout = 0
	begin
		if(ENV['debug'])
	    	puts "Locate Bitmap " + bitmap
	    end
		if @screen.exists "#{bitmap}"

			@region = @screen.exists "#{bitmap}"
			if(ENV['debug'])
				puts @region.getScore()
			end

			# the assertion has to be almost spot on

			if @region.getScore() > new_BITMAPTOLERANCELEVEL_FOR_ASSERTION
				puts @region.getScore()
				if controlParameter.include? "noHighlight"
					# do nothing - Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
				else
					if(ENV['debug'])
						@region.highlight(1)
					end
				end
			else
				nearly_not_quite = true
				fail("Throw Exception - Force Rescue Block")
			end
		else
			fail("Throw Exception - Force Rescue Block")
		end

	rescue
		sleep(1)
		if(ENV['debug'])
			puts "Rescuing - " + timeout.to_s
		end

		if nearly_not_quite == true
			fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + new_BITMAPTOLERANCELEVEL_FOR_ASSERTION.to_s + " - Score = " + @region.getScore().to_s)
		end

		if timeout >= waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
		else
			timeout += 1
			retry
		end
  end
  rescue
    puts "I should see #{bitmap} with high accuracy #{accuracy} #{controlParameter} has Failed"
  end
end


Then /^I should see approximately "(.*?)(.*)"$/ do |bitmap, controlParameter|
	begin
	#puts "NH = " +controlParameter

	# allow user to specify how long to wait
	waitingTime = ""
	if controlParameter.include? "soon"
	   waitingTime = "soon"
	elsif controlParameter.include? "eventually"
	   waitingTime = "eventually"
	end
	waitingOver = calculate_wait(waitingTime)

	nearly_not_quite = false
	timeout = 0
	begin
		if(ENV['debug'])
	    	puts "Locate Bitmap " + bitmap
	    end
		if @screen.exists "#{bitmap}"
			@region = @screen.exists "#{bitmap}"
			if(ENV['debug'])
				puts @region.getScore()
			end

			# the assertion has to be almost spot on

			if @region.getScore() > BITMAPTOLERANCELEVEL
				if controlParameter.include? "noHighlight"
					# do nothing - Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
				else
					if(ENV['debug'])
						@region.highlight(1)
					end
				end
			else
				nearly_not_quite = true
				fail("Throw Exception - Force Rescue Block")
			end
		else
			fail("Throw Exception - Force Rescue Block")
		end

	rescue
		sleep(1)
		if(ENV['debug'])
			puts "Rescuing - " + timeout.to_s
		end
		if timeout == waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
		end

		if nearly_not_quite == true
			fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL_FOR_ASSERTION.to_s + " - Score = " + @region.getScore().to_s)
		end

		timeout += 5
		retry
  end
  rescue
    puts "I should see approximately #{bitmap} #{controlParameter} has Failed"
  end
end


Then /^I should not see "(.*?)"$/ do |bitmap|
	begin
		@screen.waitVanish "#{bitmap}", 5
	rescue Exception => e
	    #puts "Exception was raised: #{e.class}"
    	puts "I should not see #{bitmap} has Failed"
	    fail("The following bitmap was found: " + bitmap)
	end
end


Then /^I should see "(.*?)" in the "(.*?)" region(.*)$/ do |bitmap,regionimg,controlParameter|
	begin
	# allow user to specify how long to wait
	waitingTime = ""
	if controlParameter.include? "soon"
	   waitingTime = "soon"
	elsif controlParameter.include? "eventually"
	   waitingTime = "eventually"
	end
	waitingOver = calculate_wait(waitingTime)
	if controlParameter == ""
		waitingOver = 10;
	end

	nearly_not_quite = false
	timeout = 0
	begin
		if(ENV['debug'])
	    	puts "Locate Bitmap " + bitmap
	    end

	    @region = @screen.exists("#{regionimg}",6).below()
		if @region
			if(ENV['debug'])
				puts @region.getScore()
			end
			@imageRegion = @region.exists("#{bitmap}",6)
			# the assertion has to be almost spot on

			if @imageRegion.getScore() > BITMAPTOLERANCELEVEL_FOR_ASSERTION
				if controlParameter.include? "noHighlight"
					# do nothing - Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
				else
					if(ENV['debug'])
						@imageRegion.highlight(1)
					end
				end
			else
				nearly_not_quite = true
				fail("Throw Exception - Force Rescue Block")
			end
		else
			fail("Throw Exception - Force Rescue Block")
		end

	rescue
		sleep(1)
		if(ENV['debug'])
			puts "Rescuing - " + timeout.to_s
		end
		if timeout == waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
		end

		if nearly_not_quite == true
			fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL_FOR_ASSERTION.to_s + " - Score = " + @region.getScore().to_s)
		end

		timeout += 5
		retry
  end
  rescue
    puts "I should see #{bitmap} in the #{regionimg} region #{controlParameter} has Failed"
  end
end
