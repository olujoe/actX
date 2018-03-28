#####################################################################################################################################################
##### This is the step definition that drives the action of Clip Search/View/Sort/Column arramgement test cases#####
##### Author: Brian Tsang
#####################################################################################################################################################

dayMonthYear = "%d/%m/%Y"
When (/^I search "(.*?)"$/) do |search|
  begin
	newtime = Time.now.strftime("%d/%m/%Y %H:%M")
	if $site == "BC_PQ_QA"
	else	
		$searchclip = search.downcase
	end
	#$searchclip = search.downcase
	case search.downcase
		when "news last hour"
			imagename = "highlightwithinlasthour.png"
		when "news last 6 hours"
			imagename = "highlightwithinlast6hours.png"
		when "news last day"
			imagename = "highlightwithinlastday.png"
		when "news last week"
			imagename = "highlightwithinlastweek.png"
		when "news at anytime"
			imagename = "highlightatanytime.png"
		when "clipname1"
			imagename = "highlightatanytime.png"
			#cliptitle = "VDOD/ANOREXIC/1021/20/7"
			if $site == "BC_PQ_QA"
				cliptitle = $clipA_Airspeed
			else
				cliptitle = $clipA				
			end	
		when "clipname2"
			imagename = "highlightatanytime.png"
			#cliptitle = "SYRIAMEDIA/ALK/0500/28/2"
			if $site == "BC_PQ_QA"
				cliptitle = $clipA_Airspeed
			else
				cliptitle = $clipA				
			end	
		when "clipname3"
			imagename = "highlightatanytime.png"
			#cliptitle = "LOCKERBIE/CAMPBELL/1200/23/8"
			if $site == "BC_PQ_QA"
				cliptitle = $clipA_Airspeed
			else
				cliptitle = $clipA				
			end	
		when "clipname4"
			imagename = "highlightatanytime.png"
			#cliptitle = "SUMMER/SHUKMAN/2200/29/7"
			if $site == "BC_PQ_QA"
				cliptitle = $clipA_Airspeed
			else
				cliptitle = $clipA				
			end	
	end
	if (@screen.exists "ENPSRed.png")
		step 'I click on "ENPSRed.png"'
			if (@screen.exists "ENPSDuoTaskbar.png")
				step 'I click on "taskbarActiveX.png"'
				step 'I click on "CLIP.png"'
			elsif (@screen.exists "backtosearch.png")
				step 'I click on "backtosearch.png"'
			end
	elsif (@screen.exists "ENPS.png")
		step 'I click on "ENPS.png"'
			if (@screen.exists "ENPSDuoTaskbar.png")
				step 'I click on "taskbarActiveX.png"'
				step 'I click on "CLIP.png"'
			elsif (@screen.exists "backtosearch.png")
				step 'I click on "backtosearch.png"'
			end
	else
				step 'I rightclick "3" pixels to the "topleft" of "mediacontrolenps.png"'
				step 'I wait "1" seconds'
				step 'I click on "BigTedW1.png"'
				step 'I wait for "West1.png" to appear'
					if (@screen.exists "max.png")
						step 'I click on "max.png"'
						#step 'I doubleclick on "ENPSActiveXBar.png"'
					end
				step 'I click on "CLIP.png"'
	end
		if $site == "BC_PQ_QA"
			step 'I click "30" pixels to the "right" of "FindContaining_airspeed.png"'
		else	
			step 'I click "30" pixels to the "right" of "FindContaining.png"'
		end
		step 'I use End'
		step 'I use the BACKSPACE "30" times'
			if search.downcase ==  "news last hour"
				onetime = Time.now - (0.5*60*60)
				onehours = onetime.strftime("%d/%m")
				$searchText = onehours
				step 'I type "'+onehours+'"'
				step 'I use TAB'
				step 'I use Home'
				if $site == "BC_PQ_QA"
					step 'I wait for "highlightwithinlasthour_airspeed.png" to appear'
				else
					step 'I wait for "highlightwithinlasthour.png" to appear'
				end	
				step 'I wait for "'+imagename+'" to appear'
			elsif search.downcase ==  "news last 6 hours"
				sixtime = Time.now - (3*60*60)
				sixhours = sixtime.strftime("%d/%m/%Y %H")
				$searchText = sixhours
				step 'I type "'+sixhours+'"'
				step 'I use TAB'
				step 'I use Home'
				if $site == "BC_PQ_QA"
					step 'I wait for "highlightwithinlasthour_airspeed.png" to appear'
				else
					step 'I wait for "highlightwithinlasthour.png" to appear'
				end	
				step 'I use Down'
				step 'I wait for "'+imagename+'" to appear'
			elsif search.downcase ==  "news last day"
				daytime = Time.now - (8*60*60)
				dayhours = daytime.strftime(dayMonthYear)
				$searchText = dayhours
				step 'I type "'+dayhours+'"'
				step 'I use TAB'
				step 'I use Home'
				if $site == "BC_PQ_QA"
					step 'I wait for "highlightwithinlasthour_airspeed.png" to appear'
				else
					step 'I wait for "highlightwithinlasthour.png" to appear'
				end	
				step 'I use the DOWNARROW "2" times'
				step 'I wait for "'+imagename+'" to appear'
			elsif search.downcase ==  "news last week"
				eightdays = Time.now - (8*24*60*60)
				eightdayhours = eightdays.strftime(dayMonthYear)
				$searchText = eightdayhours
				step 'I type "'+eightdayhours+'"'
				step 'I use TAB'
				step 'I use Home'
				if $site == "BC_PQ_QA"
					step 'I wait for "highlightwithinlasthour_airspeed.png" to appear'
				else
					step 'I wait for "highlightwithinlasthour.png" to appear'
				end	
				step 'I use the DOWNARROW "3" times'
				step 'I wait for "'+imagename+'" to appear'
			elsif search.downcase ==  "news at anytime"
				month = Time.now - (30*24*60*60)
				monthdayhours = month.strftime(dayMonthYear)
				$searchText = monthdayhours
				step 'I type "'+monthdayhours+'"'
				step 'I use TAB'
				step 'I use Home'
				if $site == "BC_PQ_QA"
					step 'I wait for "highlightwithinlasthour_airspeed.png" to appear'
				else
					step 'I wait for "highlightwithinlasthour.png" to appear'
				end	
				step 'I use End'
				step 'I wait for "'+imagename+'" to appear'
			elsif search.downcase ==  "clipname1"
				$searchText = cliptitle
				step 'I type "'+cliptitle+'"'
				step 'I use TAB'
				step 'I use Home'
				if $site == "BC_PQ_QA"
					step 'I wait for "highlightwithinlasthour_airspeed.png" to appear'
				else
					step 'I wait for "highlightwithinlasthour.png" to appear'
				end	
				step 'I use End'
				step 'I wait for "'+imagename+'" to appear'
			elsif search.downcase ==  "clipname2"
				$searchText = cliptitle
				step 'I type "'+cliptitle+'"'
				step 'I use TAB'
				step 'I use Home'
				if $site == "BC_PQ_QA"
					step 'I wait for "highlightwithinlasthour_airspeed.png" to appear'
				else
					step 'I wait for "highlightwithinlasthour.png" to appear'
				end	
				step 'I use End'
				step 'I wait for "'+imagename+'" to appear'
			elsif search.downcase ==  "clipname3"
				$searchText = cliptitle
				step 'I type "'+cliptitle+'"'
				step 'I use TAB'
				step 'I use Home'
				if $site == "BC_PQ_QA"
					step 'I wait for "highlightwithinlasthour_airspeed.png" to appear'
				else
					step 'I wait for "highlightwithinlasthour.png" to appear'
				end	
				step 'I use End'
				step 'I wait for "'+imagename+'" to appear'
			elsif search.downcase ==  "clipname4"
				$searchText = cliptitle
				step 'I type "'+cliptitle+'"'
				step 'I use TAB'
				step 'I use Home'
				if $site == "BC_PQ_QA"
					step 'I wait for "highlightwithinlasthour_airspeed.png" to appear'
				else
					step 'I wait for "highlightwithinlasthour.png" to appear'
				end	
				step 'I use End'
				step 'I wait for "'+imagename+'" to appear'
			end
		step 'I use TAB'
		step 'I press the space key'
		step 'I wait for "2" seconds'
  rescue
  	puts "I search #{search} has Failed"
  end

end

##############################################################################################################################
Then (/^I can view result$/) do
  begin
	if (@screen.exists "ClipNoResult.png")
		readSearchXML($searchText)
		if (results == "true")
			puts 'Pass, there are no clips to find'
		else
			fail("No Results FOUND!!!")
		end
	elsif (@screen.exists "noclipmatch.png")
		readSearchXML($searchText)
		if (results == "true")
			puts 'Pass, there are no clips to find'
		else
			fail("No clips matches search criteria !!!")
		end
	else
		puts 'Results FOUND! You are AWESOME!'
  end
  rescue
    puts "I can view resutl has Failed"
  end

end

def readSearchXML(searchText)
	begin
		sleep 0.5
		url = "http://newsjbhrdir00.national.core.bbc.co.uk/jupiter/west1/mediaitem/mediaitemsearchwithmosobjid.jsp?text=#{"searchText"}"
		xml_data = open(url).read
		type = []
		if(xml_data.include? "results")
			results = xml_data.split("results=")[1].split("/>")[1].strip
			puts results
			#result = results.split("<instance")[1..-1]
		end
	rescue
		puts "readSearchXML has Failed"
	end

end

Then (/^I can view all result$/) do
  begin
	#begin
		#if (@screen.exists "ClipNoResult.png")
			#fail("No Results FOUND!!!")
		#else
			#puts 'Results FOUND! You are AWESOME!'
		#end
	#rescue
		#if (@screen.exists "showfinishedplaceholderonly.png")
			#step 'I click "30" pixels to the "left" of "showfinishedplaceholderonly.png"'
		#end
	#end
	if (@screen.exists "showfinishonly.png", 10)
			step 'I click on "showfinishonly.png"'
				if (@screen.exists "ClipNoResult.png")
					readSearchXML($searchText)
					if (results == "true")
						puts 'Pass, there are no clips to find'
					else
						fail("No Results FOUND!!!")
					end
				elsif (@screen.exists "noclipmatch.png")
					readSearchXML($searchText)
					if (results == "true")
						puts 'Pass, there are no clips to find'
					else
						fail("No clips matches search criteria !!!")
					end
				else
					puts 'Results FOUND! You are AWESOME!'
				end
	elsif (@screen.exists "showall.png", 10)
				if (@screen.exists "ClipNoResult.png")
					fail("No Results FOUND!!!")
				elsif (@screen.exists "noclipmatch.png")
					fail("No clips matches search criteria !!!")
				else
					puts 'Results FOUND! You are AWESOME!'
				end
	else 
				if (@screen.exists "ClipNoResult.png")
					fail("No Results FOUND!!!")
				elsif (@screen.exists "noclipmatch.png")
					fail("No clips matches search criteria !!!")
				else
					puts 'Results FOUND! You are AWESOME!'
				end		
  end
  rescue
    puts "I can view all result has Failed"
  end


end

Then (/^I view clip detail$/) do
  begin
	step 'I doubleclick "18" pixels to the "bottom" of "nametoolbar.png"'
	step 'I wait for "backtosearch.png" to appear'
	if $site == "BC_PQ_QA"
	else	
		step 'I should see either "play.png" or "play2.png"'
	end
  rescue
    puts "I view clip detail has Failed"
  end

end

Then (/^I can see more detail$/) do
  begin
	step 'I click on "showmore.png"'
	step 'I wait for "showless.png" to appear'
	step 'I should see "showless.png" with high accuracy "0.87"'
  rescue
    puts "I can see more details has Failed"
  end

end

Then (/^I go back to search$/) do
  begin
		if $site == "BC_PQ_QA"
	        steps %Q{
		        And I wait for "backtosearch_airspeed.png" to appear
		        And I click on "backtosearch_airspeed.png"
	        }
	    else
	        steps %Q{
		        And I wait for "backtosearch.png" to appear
		        And I click on "backtosearch.png"
	        }
		end	
  rescue
    puts "I go back to search has Failed"
  end

end

Then (/^I can copy clipname$/) do
  begin
    if $site == "BC_PQ_QA"
	    steps %Q{
		    And I wait for "copyclipname_airspeed.png" to appear
		    And I click on "copyclipname_airspeed.png"
	    }
	else    
	    steps %Q{
		    And I wait for "copyclipname.png" to appear
		    And I click on "copyclipname.png"
	    }
	end    
	sleep(2)
  rescue
    puts "I can copy clipname has Failed"
  end

end

Then (/I check title "(.*?)"$/) do |titlecheck|
  begin
  sleep(2)
	shortcut = Clipboard.paste.strip.encode('UTF-8')
	shortcut.to_s.upcase
	case titlecheck.downcase
		when "clipname1"
			#cliptitle = "VDOD/ANOREXIC/1021/20/7"
			cliptitle = $clipA
			if (shortcut == cliptitle)
				puts "Clip title #{shortcut} and #{cliptitle} matches! DONE"
			else
				fail("Clip Title #{shortcut} and #{cliptitle} does not match!")
			end
		when "clipname2"
			#cliptitle = "SYRIAMEDIA/ALK/0500/28/2"
			cliptitle = $clipB
			if (shortcut == cliptitle)
				puts "Clip title #{shortcut} and #{cliptitle} matches! DONE"
			else
				fail("Clip Title #{shortcut} and #{cliptitle} does not match!")
			end
		when "clipname3"
			#cliptitle = "LOCKERBIE/CAMPBELL/1200/23/8"
			cliptitle = $clipC
			if (shortcut == cliptitle)
				puts "Clip title #{shortcut} and #{cliptitle} matches! DONE"
			else
				fail("Clip Title #{shortcut} and #{cliptitle} does not match!")
			end
		when "clipname4"
			#cliptitle = "SUMMER/SHUKMAN/2200/29/7"
			cliptitle = $clipD
			if (shortcut == cliptitle)
				puts "Clip title #{shortcut} and #{cliptitle} matches! DONE"
			else
				fail("Clip Title #{shortcut} and #{cliptitle} does not match!")
			end
		else
			fail("clip no found!")
  end
  rescue
    puts "I check title #{titlecheck} has Failed"
  end

end

##############################################################################################################################

When (/^I sort result by "(.*?)"$/) do |sort|
	case sort.downcase
		when "name"
			deselect = "namenotselected.png"
			topdown = "nameatoz.png"
			bottomup = "nameztoa.png"
		when "date"
			deselect = "datenotselected.png"
			topdown = "datetopdown.png"
			bottomup = "datebottomup.png"
		when "rating"
			deselect = "ratingnotselected.png"
			topdown = "ratingtopdown.png"
			bottomup = "ratingbottomup.png"
		when "duration"
			deselect = "durationnotselected.png"
			topdown = "durationtopdown.png"
			bottomup = "durationbottomup.png"
		when "category"
			deselect = "categorynotselected.png"
			topdown = "categoryatoz.png"
			bottomup = "categoryztoa.png"
		when "status"
			deselect = "statusnotselected.png"
			topdown = "statusatoz.png"
			bottomup = "statusztoa.png"
		when "outlet"
			deselect = "outletnotselected.png"
			topdown = "outletatoz.png"
			bottomup = "outletztoa.png"
	end


	if sort.downcase ==  "name"
		if (@screen.exists deselect)
			step 'I click on "'+deselect+'"'
			puts ("Name from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click "5" pixels to the "left" of "'+topdown+'"'
			puts ("Name from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
		elsif (@screen.exists topdown)
			step 'I click "5" pixels to the "left" of "'+topdown+'"'
			puts ("Name from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
			step 'I wait "2" seconds'
			step 'I click "5" pixels to the "left" of "'+bottomup+'"'
			puts ("Name from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
		elsif (@screen.exists bottomup)
			step 'I click "5" pixels to the "left" of "'+bottomup+'"'
			puts ("Name from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click "5" pixels to the "left" of "'+topdown+'"'
			puts ("Name from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
		end
	end

	if sort.downcase ==  "date"
		if (@screen.exists deselect)
			step 'I click on "'+deselect+'"'
			puts ("Date from Oldest to Newest!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Date from Newest to Oldest!")
			step 'I wait for "'+bottomup+'" to appear'
		elsif (@screen.exists topdown)
			step 'I click on "'+topdown+'"'
			puts ("Date from Newest to Oldest!")
			step 'I wait for "'+bottomup+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+bottomup+'"'
			puts ("Date from Oldest to Newest!")
			step 'I wait for "'+topdown+'" to appear'
		elsif (@screen.exists bottomup)
			step 'I click on "'+bottomup+'"'
			puts ("Date from Oldest to Newest!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Date from Newest to Oldest!")
			step 'I wait for "'+bottomup+'" to appear'
		end
	end


	if sort.downcase ==  "rating"
		if (@screen.exists deselect)
			step 'I click on "'+deselect+'"'
			puts ("Rating from G, A to R!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Rating from R, A to G!")
			step 'I wait for "'+bottomup+'" to appear'
		elsif (@screen.exists topdown)
			step 'I click on "'+topdown+'"'
			puts ("Rating from R, A to G!")
			step 'I wait for "'+bottomup+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+bottomup+'"'
			puts ("Rating from G, A to R!")
			step 'I wait for "'+topdown+'" to appear'
		elsif (@screen.exists bottomup)
			step 'I click on "'+bottomup+'"'
			puts ("Rating from G, A to R!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Rating from R, A to G!")
			step 'I wait for "'+bottomup+'" to appear'
		end
	end


	if sort.downcase ==  "duration"
		if (@screen.exists deselect)
			step 'I click on "'+deselect+'"'
			puts ("Duration from Shortest to Longest!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Duration from Longest to Shortest!")
			step 'I wait for "'+bottomup+'" to appear'
		elsif (@screen.exists topdown)
			step 'I click on "'+topdown+'"'
			puts ("Duration from Longest to Shortest!")
			step 'I wait for "'+bottomup+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+bottomup+'"'
			puts ("Duration from Shortest to Longest!")
			step 'I wait for "'+topdown+'" to appear'
		elsif (@screen.exists bottomup)
			step 'I click on "'+bottomup+'"'
			puts ("Duration from Shortest to Longest!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Duration from Longest to Shortest!")
			step 'I wait for "'+bottomup+'" to appear'
		end
	end


	if sort.downcase ==  "category"
		if (@screen.exists deselect)
			step 'I click on "'+deselect+'"'
			puts ("Category from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Category from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
		elsif (@screen.exists topdown)
			step 'I click on "'+topdown+'"'
			puts ("Category from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+bottomup+'"'
			puts ("Category from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
		elsif (@screen.exists bottomup)
			step 'I click on "'+bottomup+'"'
			puts ("Category from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Category from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
		end
	end


	if sort.downcase ==  "status"
		if (@screen.exists deselect)
			step 'I click on "'+deselect+'"'
			puts ("Status from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Status from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
		elsif (@screen.exists topdown)
			step 'I click on "'+topdown+'"'
			puts ("Status from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+bottomup+'"'
			puts ("Status from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
		elsif (@screen.exists bottomup)
			step 'I click on "'+bottomup+'"'
			puts ("Status from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Status from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
		end
	end

	if sort.downcase ==  "outlet"
		if (@screen.exists deselect)
			step 'I click on "'+deselect+'"'
			puts ("Outlet from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Outlet from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
		elsif (@screen.exists topdown)
			step 'I click on "'+topdown+'"'
			puts ("Outlet from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+bottomup+'"'
			puts ("Outlet from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
		elsif (@screen.exists bottomup)
			step 'I click on "'+bottomup+'"'
			puts ("Outlet from A to Z!")
			step 'I wait for "'+topdown+'" to appear'
			step 'I wait "2" seconds'
			step 'I click on "'+topdown+'"'
			puts ("Outlet from Z to A!")
			step 'I wait for "'+bottomup+'" to appear'
		end
	end


	if (@screen.exists "ClipNoResult.png")
		fail("No Results FOUND!!!")
	elsif (@screen.exists "noclipmatch.png")
		fail("No clips matches search criteria !!!")
	else
		puts 'Results FOUND! You are AWESOME!'
	end

end

##############################################################################################################################

When (/^I arrange result column$/) do
  begin
	if (@screen.exists "resultbar.png")
		steps %Q{
			And I drag "datebottomup.png" to "nametoolbar.png"
			And I drag "categorynotselected.png" to "nametoolbar.png"
			And I drag "durationnotselected.png" to "nametoolbar.png"
			And I drag "outletnotselected.png" to "nametoolbar.png"
			And I drag "statusnotselected.png" to "nametoolbar.png"
			And I should see "completearrangment2.png" with high accuracy "0.71"

		}

			#if (@screen.exists "completearrangment.png")
				#puts 'Result coloumn arrangment completes!'
			#else
				#fail("FAIL TO rearrange Result coloumn !!!")
			#end

  end
  rescue
    puts "I arrange result column has Failed"
  end

end
