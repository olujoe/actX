
BITMAPTOLERANCELEVEL = 0.71
BITMAPTOLERANCELEVEL_FOR_ASSERTION = 0.73
BITMAPTOLERANCELEVEL_FOR_EXISTS = 0.79
#WAITLONG = 750
#WAITMEDIUM = 250
#WAITSHORT = 100
WAITLONG = 500
WAITMEDIUM = 220
WAITSHORT = 100


def calculate_wait (waitingTime)
	begin
	# determine if we wait for a long time e.g waiting for a recording to finish
	if waitingTime.include? "eventually"
		waitingOver = WAITLONG
		
	elsif waitingTime.include? "soon"
		waitingOver = WAITMEDIUM
		
	else
		waitingOver = WAITSHORT
	end

	if(ENV['debug'])
		puts waitingOver.to_s	
	end
	return waitingOver
	rescue
		puts "calculate_wait has Failed"
	end
end

Given /^Wait for loading cursor$/ do
	
end

When /^I wait for "(.*?)" to appear$/ do |bitmap|
  begin
	waitingOver = WAITSHORT
	timeout = 0
	begin
		@screen.wait "#{bitmap}", 5
	rescue
		if timeout > waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
		else
			puts bitmap + " Not Present"
			timeout += 10
			retry
		end
  end
  rescue
    puts "I wait for #{bitmap} to appear has Failed"
  end
end

#Given /^I click on "(.*?)"$/ do |bitmap|
#When /^I wait for "(.*?)" to appear$/ do |bitmap|
#	retries = 0
#	tries = 0
#	image = bitmap.split(",")
#	number = image.length
#	waitingOver = WAITSHORT
#	timeout = 0
#	begin
#		mainimage = image[tries].strip
#		if @screen.exists "#{mainimage}", 10	
#			@region = @screen.exists "#{mainimage}"
#			#puts @region.getScore()
#			if @region.getScore() > BITMAPTOLERANCELEVEL
##				if(ENV['debug'])
##					@region.highlight(1)
##				end
#				@screen.click "#{mainimage}"
#			else
#		      fail("Bitmap = " + mainimage + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
#			end
#		else
#		   fail("The following bitmap cannot be found: " + mainimage )
#		end
#	rescue	
#		if tries < number - 1
#			tries = tries + 1
#		else
#			tries = 0
#		end
#		if retries < (4 * number)
#			retries = retries + 1
#			retry
#		else
#			fail("The following bitmap cannot be found: " + bitmap )
#		end
#	end
#	#step "Wait for loading cursor"
#end


When /^I wait for "(.*?)" to disappear(.*?)$/ do |bitmap,waitingTime|
  begin
	waitingOver = calculate_wait(waitingTime)
	timeout = 0
    bitmapStillThere = true
	
#    while bitmapStillThere
#		if @screen.waitVanish "#{bitmap}"
#			bitmapStillThere = false
#		end
#		puts "still there"
#	end

    while bitmapStillThere			
		timeout += 10			
		if @screen.waitVanish "#{bitmap}",5
			bitmapStillThere = false
		else
			puts bitmap + " Still Present"
		end
				
		if !@screen.exists "#{bitmap}",5
			bitmapStillThere = false
		end

		if timeout == waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
		end
		
	end	
	if(ENV['debug'])
		puts bitmap + " Disappeared"
  end
  rescue
    puts "I wait for #{bitmap} to disappear #{waitingTime} has Failed"
  end
end

Then /^I wait "(.*?)" seconds$/ do |delay|
	begin
  sleep "#{delay}".to_i
  rescue
    puts "I wait #{delay} seconds has Failed"
  end
end

Then /^I wait for "(.*?)" seconds$/ do |delay|
	begin
  sleep "#{delay}".to_i
  rescue
    puts ""
  end
end

Then /^I wait "(.*?)" milliseconds$/ do |delay|
	begin
		delayms = delay.to_i
 		sleep delayms/1000
	rescue
		puts "I wait for #{delay} seconds has Failed"
	end
end

Then /^I wait upto "(.*?)" seconds for "(.*?)" to vanish$/ do |delay, bitmap|
	begin
  @screen.waitVanish "#{bitmap}", "#{delay}".to_i
	rescue
		puts "I wait upto #{delay} seconds for #{bitmap} to vanish has Failed"
	end
end

When /^I wait for either "(.*?)" or "(.*?)" to appear$/ do |bitmap,bitmap2|
	begin
	waitingOver = WAITSHORT
	timeout = 0
	begin
		steps %Q{
			And I should see either "#{bitmap}" or "#{bitmap2}"
		}
	rescue

		if timeout > waitingOver
			fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
		else
			puts bitmap + " Not Present"
			timeout += 10
			retry
		end
  end
	rescue
		puts "I wait for either #{bitmap} or #{bitmap2} to appear has Failed"
	end
end