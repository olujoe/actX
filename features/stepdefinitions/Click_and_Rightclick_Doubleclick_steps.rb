
Given /^I click on "(.*?)" if exists(.*)$/ do |bitmap, controlParameter|
	begin
	puts "clicking on '#{bitmap}'"
	if @screen.exists "#{bitmap}", 1
		#the value here sets the screen number (1-main, 2, on the right, 3 on the left ...)
    	@region = @screen.exists "#{bitmap}"

		if(ENV['debug'])
    		puts @region.getScore()
    	end

    	begin

	        if @region.getScore() > BITMAPTOLERANCELEVEL_FOR_EXISTS
				if controlParameter.include? "noHighlight"
					# do nothing - Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
				else
					if(ENV['debug'])
						@region.highlight(1)
					end
				end
	    		@screen.click "#{bitmap}"
	        else
	           puts "Bitmap Exists = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL_FOR_EXISTS.to_s + " - Score = " + @region.getScore().to_s
	        end
	    rescue

	    end
	else
		puts "Bitmap = " + bitmap + " does Not Exist"
  end
  rescue
    puts "I cant on #{bitmap} if exists #{controlParameter} has Failed"
  end

end

Given /^I waitAndclick on "(.*?)"$/ do |bitmap|
	begin
		@screen.wait "#{bitmap}", 20
	    @screen.click "#{bitmap}"
  rescue
    	puts "I waitAndclick on #{bitmap} has Failed"
    	fail("The following bitmap cannot be found: " + bitmap)
	end
end

Given /^I click on dropdown "(.*?)"$/ do |bitmap|
	begin
		@screen.wait "#{bitmap}", 10
		@region = @screen.exists "#{bitmap}"
		#@region.highlight(1)
	    @screen.click "#{bitmap}"
  rescue
    	puts "I click on dropdown #{bitmap} has Failed"
    	fail("The following bitmap cannot be found: " + bitmap + "\n")
	end
end

Given /^I click on dropdown "(.*?)" and click "(.*?)"$/ do |bitmap, bitmap2|
	begin
		@screen.wait "#{bitmap}", 10
		@region = @screen.exists "#{bitmap}"

	    if @region.getScore() > BITMAPTOLERANCELEVEL
		  #@region.highlight(1)
	      @screen.click "#{bitmap}"
		else
		    puts @region.getScore()
	        fail("The following bitmap cannot be found: " + bitmap + "\n")
	    end

	    @region = @screen.exists "#{bitmap2}"
		if(ENV['debug'])
			puts @region.getScore()
		end

	    if @region.getScore() > BITMAPTOLERANCELEVEL
		  @screen.click "#{bitmap2}"
		else
	      fail("Bitmap = " + bitmap2 + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
	    end

  rescue
    	puts "I click on dropdown #{bitmap} and click #{bitmap2} has Failed"
    	fail("The following bitmap cannot be found: " + bitmap + "\n")
	end
end

Given /^I hover on "(.*?)"$/ do |bitmap|
	retries = 0
	begin
	#   @value = @screen.exists "#{bitmap}", 10
	#   puts @value
		if @screen.exists "#{bitmap}", 10
			@region = @screen.exists "#{bitmap}"
			#puts @region.getScore()
			if @region.getScore() > BITMAPTOLERANCELEVEL
				if(ENV['debug'])
					@region.highlight(3)
				end
				@screen.hover "#{bitmap}"
			else
		      fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
			end
		else
		   fail("The following bitmap cannot be found: " + bitmap )
		end
	rescue
		if(retries == 0)
			retries = retries + 1
			retry
    else
      puts "I hover on #{bitmap} has Failed"
			fail("The following bitmap cannot be found: " + bitmap )
		end
	end
	#step "Wait for loading cursor"
end

Given /^I click on "(.*?)"$/ do |bitmap|
	retries = 0
	begin
	#   @value = @screen.exists "#{bitmap}", 10
	#   puts @value
		if @screen.exists "#{bitmap}", 10
			@region = @screen.exists "#{bitmap}"
			#puts @region.getScore()
			if @region.getScore() > BITMAPTOLERANCELEVEL
				if(ENV['debug'])
					@region.highlight(3)
				end
				@screen.click "#{bitmap}"
			else
		      fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
			end
		else
		   fail("The following bitmap cannot be found: " + bitmap )
		end
	rescue
		if(retries == 0)
			retries = retries + 1
			retry
    else
      puts "I click on #{bitmap} has Failed"
			fail("The following bitmap cannot be found: " + bitmap )
		end
	end
	#step "Wait for loading cursor"
end

Given /^I clickAndHold on "(.*?)"$/ do |bitmap|
  begin
	#step "Wait for loading cursor"
	#begin
	#   @value = @screen.exists "#{bitmap}", 10
	#   puts @value
		if @screen.exists "#{bitmap}", 10
			@region = @screen.exists "#{bitmap}"
			#puts @region.getScore()
				if @region.getScore() > BITMAPTOLERANCELEVEL
					if(ENV['debug'])
						@region.highlight(1)
					end
					@region.drag_drop(11, 202, 2, 202)
					#@region.drag_drop(1281, 202, 2, 202)
					#@screen.click_and_hold(6,"#{bitmap}")
				else
		     		fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
		    	end
		else
		   #fail("The following bitmap cannot be found: " + bitmap )
		end
	step "Wait for loading cursor"
  rescue
    put "I clickAndHold on #{bitmap} has Failed"
  end

end

Given /^I click on "(.*?)" with noHighlight$/ do |bitmap|
  begin
#Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
  #begin
#   @value = @screen.exists "#{bitmap}", 10
#   puts @value
    if @screen.exists "#{bitmap}", 10
		@region = @screen.exists "#{bitmap}"
		#puts @region.getScore()
		if @region.getScore() > BITMAPTOLERANCELEVEL
			@screen.click "#{bitmap}"
		else
	      fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
		end
	else
	   fail("The following bitmap cannot be found: " + bitmap )
    end
  #end
  rescue
    puts "I click on #{bitmap} with noHighlight has Failed"
  end

end

Given /^I doubleclick on "(.*?)" until "(.*?)" appears(.*)$/ do |bitmap, bitmap2, waitingTime|
  begin
	timeout = 0
	waitingOver = calculate_wait(waitingTime)
	#puts waitingOver.to_s

	#if !@screen.exists "#{bitmap2}"
		begin
		   bitmap2report = bitmap
		   @region = @screen.exists "#{bitmap}"
			if @region.getScore() > BITMAPTOLERANCELEVEL
				if(ENV['debug'])
			   		puts bitmap + " Clicked"
			   end
			   if(ENV['debug'])
			   		@region.highlight(1)
			   	end
			   @screen.doubleClick "#{bitmap}"
			end

			sleep 3

			bitmap2report = bitmap2
			@screen.wait "#{bitmap2}", 10
			@region = @screen.exists "#{bitmap2}", 10
			#puts @region.getScore()

			if @region.getScore() > BITMAPTOLERANCELEVEL_FOR_EXISTS
				if(ENV['debug'])
			   		puts "Bitmap found - " +bitmap2
			   	end
			else
				fail("Throw Exception - Force Rescue Block")
			end

		rescue
			if timeout > waitingOver
				fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap2report)
			else
				timeout = timeout + 10
				#puts "Timeout= " + timeout.to_s
				retry
			end
		end
	#end
  rescue
    puts "I doubleclick on #{bitmap} until #{bitmap2} appears #{waitingTime} has Failed"
  end

end

Given /^I click on "(.*?)" until "(.*?)" appears(.*)$/ do |bitmap, bitmap2, waitingTime|
  begin
	timeout = 0
	waitingOver = calculate_wait(waitingTime)
	#puts waitingOver.to_s

	#if !@screen.exists "#{bitmap2}"
		begin
		   bitmap2report = bitmap
		   @region = @screen.exists "#{bitmap}"
			if @region.getScore() > BITMAPTOLERANCELEVEL
				if(ENV['debug'])
			   		puts bitmap + " Clicked"
			   end
			   if(ENV['debug'])
			   		@region.highlight(1)
			   	end
			   @screen.click "#{bitmap}"
			end

			sleep 3

			bitmap2report = bitmap2
			@screen.wait "#{bitmap2}", 10
			@region = @screen.exists "#{bitmap2}", 10
			#puts @region.getScore()

			if @region.getScore() > BITMAPTOLERANCELEVEL_FOR_EXISTS
				if(ENV['debug'])
			   		puts "Bitmap found - " +bitmap2
			   	end
			else
				fail("Throw Exception - Force Rescue Block")
			end

		rescue
			if timeout > waitingOver
				fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap2report)
			else
				timeout = timeout + 10
				#puts "Timeout= " + timeout.to_s
				retry
			end
		end
	#end
  rescue
    puts "I click on #{bitmap} until #{bitmap2} appears #{waitingTime} has Failed"
  end

end

Given /^I type "(.*?)" until "(.*?)" appears(.*)$/ do |button, bitmap2|
  begin
	timeout = 0
	waitingOver = 30
	begin
	    step 'I type F4'
		sleep 3
		bitmap2report = bitmap2
		@screen.wait "#{bitmap2}", 10
		@region = @screen.exists "#{bitmap2}", 10
		if @region.getScore() > BITMAPTOLERANCELEVEL_FOR_EXISTS
			if(ENV['debug'])
		   		puts "Bitmap found - " +bitmap2
		   	end
		else
			fail("Throw Exception - Force Rescue Block")
		end
	rescue
		if timeout > waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap2report)
		else
			timeout = timeout + 10
			retry
		end
  end
  rescue
    puts "I type #{button} until #{bitmap2} appears(.*) has Failed"
  end

end

Given /^I click on "(.*?)" until "(.*?)" disappears(.*)$/ do |bitmap, bitmap2, waitingTime|
  begin
		timeout = 0
		waitingOver = calculate_wait(waitingTime)
		#puts waitingOver.to_s

		begin
			while timeout < waitingOver
				bitmap2report = bitmap
				@region = @screen.exists "#{bitmap}"
				if @region.getScore() > BITMAPTOLERANCELEVEL
					#puts bitmap + " Clicked"
					if(ENV['debug'])
						@region.highlight(1)
					end
					@screen.click "#{bitmap}"
				end

				sleep 1
				bitmap2report = bitmap2
				@screen.wait "#{bitmap2}", 5

				timeout += 5
				puts "Timeout= " + timeout.to_s
			end
			rescue
			puts "Bitmap Disappeared - " +bitmap2
		end

		if timeout > waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap has not Disappeared: " + bitmap2report )
		end
  rescue
    puts "I click on #{bitmap} until #{bitmap2} disappears#{waitingTime} has Faield"
  end

end

Given /^I doubleclick on "(.*?)" until "(.*?)" disappears(.*)$/ do |bitmap, bitmap2, waitingTime|
  begin
		timeout = 0
		waitingOver = calculate_wait(waitingTime)
		#puts waitingOver.to_s

		begin
			while timeout < waitingOver
				bitmap2report = bitmap
				@region = @screen.exists "#{bitmap}"
				if @region.getScore() > BITMAPTOLERANCELEVEL
					#puts bitmap + " Clicked"
					if(ENV['debug'])
						@region.highlight(1)
					end
					@screen.doubleClick "#{bitmap}"
				end

				sleep 1
				bitmap2report = bitmap2
				@screen.wait "#{bitmap2}", 10

				timeout += 5
				puts "Timeout= " + timeout.to_s
			end
			rescue
			puts "Bitmap Disappeared - " +bitmap2
		end

		if timeout > waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap has not Disappeared: " + bitmap2report )
    end
  rescue
    puts "I doubleclick on #{bitmap} until #{bitmap2} disappears#{waitingTime} has Failed"
  end

end

Given /^I click on "(.*?)" if "(.*?)" exists$/ do |bitmap, bitmap2|
	begin
	    @screen.wait "#{bitmap2}", 5
	    if @screen.exists "#{bitmap2}"
			step 'I click on "'+bitmap+'"'
	    end
	rescue
		#fail("The following bitmap cannot be found: " + bitmap + "\n")
    puts "I click on #{bitmap} if #{bitmap2} exists has Failed"
	end
end

Given /^I click on "(.*?)" if "(.*?)" not exists$/ do |bitmap1, bitmap2|
  begin
    if !(@screen.exists "#{bitmap2}")
		step 'I click on "'+bitmap1+'"'
    #else
      ## do nothing if Jupiter already open
      	#step 'I click on "'+bitmap2+'"'
    end
  rescue
    puts "I click on #{bitmap1} if #{bitmap2} not exists"
  end

end

Given /^I doubleclick on "(.*?)"$/ do |bitmap|
	begin
		tries = 0
		begin
			@screen.wait "#{bitmap}", 5
			@region = @screen.exists "#{bitmap}"
			if(ENV['debug'])
				@region.highlight(1)
			end
			@screen.doubleClick "#{bitmap}"
		rescue
			if tries > 4
				fail("The following bitmap cannot be found: " + bitmap )
			else
				tries = tries + 1
				retry
			end
    end
  rescue
    puts "I doubleclick on #{bitmap} has Failed"
  end

end

Given /^I rightclick on "(.*?)" and click "(.*?)"$/ do |bitmap, bitmap2|
	begin
			@screen.wait "#{bitmap}", 10
			@region = @screen.exists "#{bitmap}",3
			#puts @region.getScore()

		#@screen.wait "#{bitmap}", 20
		if @region.getScore() > BITMAPTOLERANCELEVEL
			if(ENV['debug'])
				puts bitmap + " RightClicked"
			end
			@screen.rightClick "#{bitmap}"
		else
			fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
		end

		@screen.wait "#{bitmap2}", 5
		@region = @screen.exists "#{bitmap2}"
		#puts @region.getScore()

		if @region.getScore() > BITMAPTOLERANCELEVEL
			if(ENV['debug'])
				puts bitmap2 + " Clicked"
			end
			@screen.click "#{bitmap2}"
		else
			fail("Bitmap = " + bitmap2 + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s )
		end

	rescue
		puts "I rightclick on #{bitmap} and click #{bitmap2} has Failed"
	end
end

Given /^I rightclick on "(.*?)"$/ do |bitmap|
	begin
		@screen.wait "#{bitmap}", 10
		@region = @screen.exists "#{bitmap}",1

		if @region.getScore() > BITMAPTOLERANCELEVEL
			if(ENV['debug'])
				puts bitmap + " RightClicked"
			end
			@screen.rightClick "#{bitmap}"
		else
			fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
		end
  rescue
    puts "I rightclick on #{bitmap} has Failed"
  end

end

When /^I click on "(.*?)" in the region$/ do |bitmap|
	begin
  t=r.find "#{bitmap}".getCenter().offset(0,0)
  @screen.click(t)
  rescue
    puts "I click on #{bitmap} in the region has Failed"
  end
end

Given /^I doubleclick on either "(.*?)" or "(.*?)"$/ do |bitmap, bitmap2|
	begin
		begin
			@screen.wait "#{bitmap}", 5
		rescue
			@screen.wait "#{bitmap2}", 5
		end
		if @screen.exists "#{bitmap}"
			@region = @screen.exists "#{bitmap}"
			@region.highlight(1)
			@screen.doubleClick "#{bitmap}"
		else
			@region = @screen.exists "#{bitmap2}"
			@region.highlight(1)
			@screen.doubleClick "#{bitmap2}"
		end
  rescue
    puts "I doubleclick on either #{bitmap} or #{bitmap2} has Failed"
		fail("The following bitmap cannot be found: " + bitmap + " or " + bitmap2)
	end
end

Given /^I doubleclick on "(.*?)" or "(.*?)" or "(.*?)" or "(.*?)"$/ do |bitmap, bitmap2, bitmap3, bitmap4|
	begin
		#begin
			#@screen.wait "#{bitmap}", 5
		#rescue
			#@screen.wait "#{bitmap2}", 5
		#end
		if @screen.exists "#{bitmap}"
			@region = @screen.exists "#{bitmap}"
			@region.highlight(1)
			@screen.doubleClick "#{bitmap}"
		elsif @screen.exists "#{bitmap2}"
			@region = @screen.exists "#{bitmap2}"
			@region.highlight(1)
			@screen.doubleClick "#{bitmap2}"
		elsif @screen.exists "#{bitmap3}"
			@region = @screen.exists "#{bitmap3}"
			@region.highlight(1)
			@screen.doubleClick "#{bitmap3}"
		else @screen.exists "#{bitmap4}"
			@region = @screen.exists "#{bitmap4}"
			@region.highlight(1)
			@screen.doubleClick "#{bitmap4}"
		end
  rescue
    puts "I doubleclick on #{bitmap} or #{bitmap2} or #{bitmap3} or #{bitmap4} has Failed"
		fail("The following bitmap cannot be found: " + bitmap + " or " + bitmap2 +  " or " + bitmap3 +  " or " + bitmap4)
	end
end

Given /^I click on either "(.*?)" or "(.*?)"$/ do |bitmap,bitmap2|
	begin
		res = 0
		begin

			#   @value = @screen.exists "#{bitmap}", 10
			#   puts @value
			if @screen.exists "#{bitmap}", 5
				@region = @screen.exists "#{bitmap}"
				#puts @region.getScore()
				if @region.getScore() > BITMAPTOLERANCELEVEL
					#@region.highlight(1)
					@screen.click "#{bitmap}"
				else
					#begin
							#	fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
					#rescue
						if @screen.exists "#{bitmap2}", 5
							@region = @screen.exists "#{bitmap2}"
							#puts @region.getScore()
							if @region.getScore() > BITMAPTOLERANCELEVEL
								#@region.highlight(1)
								@screen.click "#{bitmap2}"
							else
									fail("Bitmap = " + bitmap2 + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
							end
						else
							 fail("The following bitmaps cannot be found: " + bitmap + " or " + bitmap2)
						end
					#end
				end
			elsif @screen.exists "#{bitmap2}", 2
				@region = @screen.exists "#{bitmap2}"
				#puts @region.getScore()
				if @region.getScore() > BITMAPTOLERANCELEVEL
					#@region.highlight(1)
					@screen.click "#{bitmap2}"
				else
						fail("Bitmap = " + bitmap2 + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
				end

			else
				 fail("The following bitmaps cannot be found: " + bitmap + " or " + bitmap2)
			end
			step "Wait for loading cursor"

		rescue
			if res < 5
				retry
			else
				res = res + 1
			end
		end
  rescue
    puts "I click on either #{bitmap} or #{bitmap2} has failed"
  end
end

####This is where I edit the topleft right click ###

Given /^I rightclick "(.*?)" pixels to the "(.*?)" of "(.*?)"$/ do |pixels,position,image|
	begin
		nooftries = 0
		case position.downcase
			when "right"
				begin
					region = @screen.exists("#{image}",6).right(pixels.to_i)
				rescue
					if nooftries < 3
						retry
					else
						nooftries = nooftries + 1
					end
				end
			when "left"
				begin
					region = @screen.exists("#{image}",6).left(pixels.to_i)
				rescue
					if nooftries < 3
						retry
					else
						nooftries = nooftries + 1
					end
				end
			when "bottom"
				begin
					region = @screen.exists("#{image}",6).below(pixels.to_i)
				rescue
					if nooftries < 3
						retry
					else
						nooftries = nooftries + 1
					end
				end
			when "left"
				begin
					region = @screen.exists("#{image}",0).left(pixels.to_i)
					#region = @screen.exists("#{image}",0).above(pixels.to_i)
				rescue
					if nooftries < 3
						retry
					else
						nooftries = nooftries + 1
					end
				end
			when "topleft"
				begin
					region = @screen.exists("#{image}",0).left(pixels.to_i).above(pixels.to_i)
				rescue
					if nooftries < 3
						retry
					else
						nooftries = nooftries + 1
					end
				end
			when "topright"
				begin
					region = @screen.exists("#{image}",0).right(pixels.to_i).above(pixels.to_i)
				rescue
					if nooftries < 3
						retry
					else
						nooftries = nooftries + 1
					end
				end
			else
				fail("Code for this 'click position' hasnt been entered- #{position}")
		end
		@screen.rightClick(region)
  rescue
    puts "I rightclick #{pixels} pixels to the #{position} of #{image} has Failed"
  end
end

####This is where I edit the topleft right click ###

Given /^I click "(.*?)" pixels to the "(.*?)" of "(.*?)"$/ do |pixels,position,image|
	begin
  nooftries = 0
	case position.downcase
		when "right"
			begin
				region = @screen.exists("#{image}",6).right(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "left"
			begin
				region = @screen.exists("#{image}",6).left(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "bottom"
			begin
				region = @screen.exists("#{image}",6).below(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "top"
			begin
				region = @screen.exists("#{image}",6).above(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "topleft"
			begin
				region = @screen.exists("#{image}",0).left(pixels.to_i).above(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "topright"
			begin
				region = @screen.exists("#{image}",0).right(pixels.to_i).above(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "bottomleft"
			begin
				region = @screen.exists("#{image}",0).left(pixels.to_i).below(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "bottomright"
			begin
				region = @screen.exists("#{image}",0).right(pixels.to_i).below(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		else
			fail("Code for this 'click position' hasnt been entered- #{position}")
	end
	@screen.click(region)
  rescue
    puts "I click #{pixels} pixels to the #{position} of #{image} has Faield"
  end
end

Given /^I doubleclick "(.*?)" pixels to the "(.*?)" of "(.*?)"$/ do |pixels,position,image|
	begin
	nooftries = 0
	case position.downcase
		when "right"
			begin
				region = @screen.exists("#{image}",6).right(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "left"
			begin
				region = @screen.exists("#{image}",6).left(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "bottom"
			begin
				region = @screen.exists("#{image}",6).below(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "top"
			begin
				region = @screen.exists("#{image}",6).above(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "topleft"
			begin
				region = @screen.exists("#{image}",0).left(pixels.to_i).above(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "topright"
			begin
				region = @screen.exists("#{image}",0).right(pixels.to_i).above(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		else
			fail("Code for this 'click position' hasnt been entered- #{position}")
	end
	@screen.doubleClick(region)
  rescue
    puts "I doubleclick #{pixels} pixels to the #{position} of #{image} has Faield"
  end
end

Given /^I read text from "(.*?)" pixels to the "(.*?)" of "(.*?)"$/ do |pixels,position,image|
	begin
  nooftries = 0
	case position.downcase
		when "right"
			begin
				region = @screen.exists("#{image}",6).right(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "left"
			begin
				region = @screen.exists("#{image}",6).left(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "bottom"
			begin
				region = @screen.exists("#{image}",6).below(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		when "top"
			begin
				region = @screen.exists("#{image}",6).above(pixels.to_i)
			rescue
				if nooftries < 3
					retry
				else
					nooftries = nooftries + 1
				end
			end
		else
			fail("Code for this 'click position' hasnt been entered- #{position}")
	end
	region.highlight(5)
	puts region.text()
  rescue
    puts "I read text from #{pixels} pixels to the #{position} of #{image} has Failed"
  end
end

Given /^I click on the OK button$/ do
	begin
	res = 0
	begin
		if @screen.exists "button_OK4.png", 2
			@screen.doubleClick "button_OK4.png"
		else
			region = @screen.exists "button_OK.png",2
			@screen.doubleClick(region)
		end
	rescue
		if res < 5
			retry
		else
			res = res + 1
		end
	end
  rescue
    puts "I click on the OK button has Failed"
  end
end

Given(/^Within region "(.*?)" click "(.*?)"$/) do |regionImage, clickImage|
 begin
	region = @screen.exists("#{regionImage}")
	region.click "#{clickImage}"
 rescue
   puts "Within region #{regionImage} click #{clickImage} has Failed"
 end
end

Given /^I rightclick on either "(.*?)" or "(.*?)"$/ do |bitmap,bitmap2|
	begin
	#step "Wait for loading cursor"

	#   @value = @screen.exists "#{bitmap}", 10
	#   puts @value
	if @screen.exists "#{bitmap}", 5
		@region = @screen.exists "#{bitmap}"
		#puts @region.getScore()
		if @region.getScore() > BITMAPTOLERANCELEVEL
			#@region.highlight(1)
			@screen.rightClick "#{bitmap}"
		else
			#begin
	      	#	fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
			#rescue
				if @screen.exists "#{bitmap2}", 5
					@region = @screen.exists "#{bitmap2}"
					#puts @region.getScore()
					if @region.getScore() > BITMAPTOLERANCELEVEL
						#@region.highlight(1)
						@screen.rightClick "#{bitmap2}"
					else
				      fail("Bitmap = " + bitmap2 + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
					end
				else
				   fail("The following bitmaps cannot be found: " + bitmap + " or " + bitmap2)
				end
			#end
		end
	elsif @screen.exists "#{bitmap2}", 2
		@region = @screen.exists "#{bitmap2}"
		#puts @region.getScore()
		if @region.getScore() > BITMAPTOLERANCELEVEL
			#@region.highlight(1)
			@screen.rightClick "#{bitmap2}"
		else
	      fail("Bitmap = " + bitmap2 + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
		end

	else
	   fail("The following bitmaps cannot be found: " + bitmap + " or " + bitmap2)
	end
	step "Wait for loading cursor"
  rescue
    puts "I rightclick on either #{bitmap} or #{bitmap2} has Failed"
  end
end
