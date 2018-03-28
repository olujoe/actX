
#####################################################################################################################################################
####### Step definition to support common steps in features#####
##### Edited: Olugbenga Ogunbusola
##### Author: Brian Tsang
#####################################################################################################################################################

#step 'I click on "ENPS.png" if exists'
#step 'I click on "ENPSRed.png" if exists'


## Environment config settings

def getConfigData(site,option)
	begin
   $config[site][option]
	rescue
		puts "getConfigData has Failed"
	end
end

##ENPS Action
Given (/^I use ENPS$/) do
  begin
    step 'I hover on "ENPS.png"'
			if (@screen.exists "taskbarENPS.png")
					step 'I click on "taskbarENPS.png"'
					step 'I use Alt F4'
						if (@screen.exists "suretoexit.png")
							step 'I click on "Yes.png"'
						end
						sleep (0.2)
						if (@screen.exists "savechanges.png")
							step 'I click on "no.png"'
						end
          step 'I click on "windows_start.png"'
					step 'I type "enps"'
					step 'I use RETURN'
      end
  rescue
    puts "I use ENPS has Failed"
  end
end

Given (/^I use ENPSRed$/) do
  begin
		step 'I hover on "ENPSRed.png"'
			if (@screen.exists "taskbarENPS.png")
					step 'I click on "taskbarENPS.png"'
					step 'I use Alt F4'
						if (@screen.exists "suretoexit.png")
							step 'I click on "Yes.png"'
						end
						sleep (0.2)
						if (@screen.exists "savechanges.png")
							step 'I click on "no.png"'
						end
					step 'I click on "windows_start.png"'
					step 'I type "enps"'
					step 'I use RETURN'
			end
	rescue
	puts "I use ENPSRed has Failed"
  end
end

Given (/^I go to ENPS$/) do
	begin
    if (@screen.exists "windows_start.png")
			step 'I click on "windows_start.png"'
		elsif (@screen.exists "windows_mostart.png")
			step 'I click on "windows_mostart.png"'
		else
			step 'I hover on "windows_brscreen.png"'
			step 'I click on "windows_start.png"'
		end
		step 'I type "enps"'
		step 'I use RETURN'
		sleep (2)
		if ((!@screen.exists "enps_start.png") || (!@screen.exists "enps_start2.png"))
			#step 'I use Alt F4'
			#step 'I click on "yes.png" if exists'
			#step 'I click on "no.png" if exists'
			if (@screen.exists "ENPSRed.png")
				step 'I use ENPSRed'
			elsif (@screen.exists "ENPS.png")
				step 'I use ENPS'
			end
			 sleep (2)
			if (@screen.exists "expire.png")
				step 'I click on "expire_ok.png"'
			end
			if (@screen.exists "ENPS_PRINTER.png")
				step 'I click on "ENPS_PRINTER_OK_Button.png"'
			end
			step 'I should see either "enps_start.png" or "enps_start2.png"'
			step 'I click on "max.png" if exists'
		else
			step 'I should see either "enps_start.png" or "enps_start2.png"'
			step 'I click on "max.png" if exists'
    end
  rescue
  	puts "I go to ENPS has Failed"
  end
end


######################################################################################################

#Start BigTed Active X section

###################################################################

When (/^I start "([^"]*)"$/) do |site|
  begin
		$config.each do |sites| #Starts of the loop
			#puts sites
			$site = site
			if (sites[0]==site)
				puts "yes"
					sites[1].each do |checksite|
						newsite = checksite[1][0]
						puts newsite
						enpsbigtedsel = newsite["enpsbigtedsel"]
						bigtedsitelogo = newsite["bigtedsitelogo"]
						#puts enpsbigtedsel
						#puts bigtedsitelogo

						step 'I rightclick "3" pixels to the "topleft" of "mediacontrolenps.png"'
						step 'I wait "1" seconds'

						step 'I click on "'+enpsbigtedsel+'"'
				    	puts "Site #{site} Opened!!"
				    	sleep (2)
				    	step 'I should see "'+bigtedsitelogo+'" with high accuracy "0.87"'
				    	if (@screen.exists "max.png")
							step 'I click on "max.png"'
							#step 'I doubleclick on "ENPSActiveXBar.png"'
						else
							puts ("Screen Maximuised")
						end
				    	break
					end

			end

    end
	rescue
		puts "I start #{site} has Failed"
	end
end


When (/^site "(.*?)" is opened$/) do |site|
  begin
		$config.each do |sites| #Starts of the loop
			#puts sites
			$site = site
			if (sites[0]==site)
				puts "yes"
					sites[1].each do |checksite|
						newsite = checksite[1][0]
						puts newsite
						enpsbigtedsel = newsite["enpsbigtedsel"]
						bigtedsitelogo = newsite["bigtedsitelogo"]
						#puts enpsbigtedsel
						#puts bigtedsitelogo

				    	step 'I should see "'+bigtedsitelogo+'" with high accuracy "0.87"'
				    	if (@screen.exists "max.png")
							step 'I click on "max.png"'
							#step 'I doubleclick on "ENPSActiveXBar.png"'
						else
							puts ("Screen Maximuised")
						end
				    	break
					end
			end
    end
  rescue
    puts "site #{site} is opened has Failed"
  end
end

=begin

When (/^I start site "([^"]*)"$/) do |openbigtedsite|
	step 'I rightclick "3" pixels to the "topleft" of "mediacontrolenps.png"'
	step 'I wait "1" seconds'
		if (openbigtedsite == "BigTedW1")
			steps %Q{
				And I click on "BigTedW1.png"
				And I should see "West1.png" with high accuracy "0.87"
			}
		elsif (openbigtedsite == "BigTedMillbank")
			steps %Q{
				And I click on "BigTedMillbank.png"
				And I should see "Millbank.png" with high accuracy "0.87"
			}
		elsif (openbigtedsite == "PlymouthBigTed")
			steps %Q{
				And I click on "PlymouthBigTed.png"
				And I wait for "Plymouth.png" to appear
			}
		elsif (openbigtedsite == "BigTedATVPTV")
			steps %Q{
				And I click on "BigTedATVPTV.png"
				And I wait for "ATVPTV.png" to appear
			}
		end
	if (@screen.exists "max.png")
		step 'I click on "max.png"'
		#step 'I doubleclick on "ENPSActiveXBar.png"'
	else
		put ("Screen Maximuised")
	end
end




Then (/^site "(.*?)" is opened$/) do |seebigtedsite|
	if (seebigtedsite == "BigTedW1")
		steps %Q{
			And I should see "West1.png" with high accuracy "0.87"
		}
	elsif (seebigtedsite == "BigTedMillbank")
		steps %Q{
		 	And I should see "Millbank.png" with high accuracy "0.87"
		}
	elsif (seebigtedsite == "PlymouthBigTed")
		steps %Q{
			And I should see "Plymouth.png" with high accuracy "0.87"
		}
	elsif (seebigtedsite == "BigTedATVPTV")
		steps %Q{
			And I should see "ATVPTV.png" with high accuracy "0.87"
		}
	end
end


Then (/^I can fullscreen BigtedActiveX$/) do
	step 'I doubleclick on "ENPSActiveXBar.png"'
end

=end


###################################################################

#Open Clip, CG, Mosart Section

###################################################################

#step 'I click on "ENPS.png" if exists'

Given (/^"([^"]*)" section open in "([^"]*)"$/) do |objectsection, site|
  begin
	$config.each do |sites| #Starts of the loop
				#puts sites
				if (sites[0]==site)
					puts "yes"
						sites[1].each do |checksite|
							newsite = checksite[1][0]
							puts newsite
							enpsbigtedsel = newsite["enpsbigtedsel"]
							bigtedsitelogo = newsite["bigtedsitelogo"]
							#puts enpsbigtedsel
							#puts bigtedsitelogo
	#=begin
													if (@screen.exists "ENPSRed.png")
															step 'I hover on "ENPSRed.png"'
																if (@screen.exists "ENPSDuoTaskbar.png")
																		step 'I click on "taskbarActiveX.png"'
																		step 'I should see "'+bigtedsitelogo+'" with high accuracy "0.87"'
																		step 'I click on "max.png" if exists'
																		if (objectsection== "CLIP")
																			step 'I click on "CLIP.png"'
																		elsif (objectsection=="CG")
																			step 'I click on "CG.png"'
																		elsif (objectsection=="MOSART")
																			step 'I click on "MOSART.png"'
																		end
																	break
																elsif (@screen.exists "taskbarENPS.png")
																		step 'I click on "taskbarENPS.png"'
																else
																	fail "can't find image.!"
																end
													elsif (@screen.exists "ENPS.png")
															step 'I hover on "ENPS.png"'
																if (@screen.exists "ENPSDuoTaskbar.png")
																		step 'I click on "taskbarActiveX.png"'
																		step 'I should see "'+bigtedsitelogo+'" with high accuracy "0.87"'
																		step 'I click on "max.png" if exists'
																		if (objectsection== "CLIP")
																			step 'I click on "CLIP.png"'
																		elsif (objectsection=="CG")
																			step 'I click on "CG.png"'
																		elsif (objectsection=="MOSART")
																			step 'I click on "MOSART.png"'
																		end
																	break
																elsif (@screen.exists "taskbarENPS.png")
																		step 'I click on "taskbarENPS.png"'
																else
																	fail "can't find image.!"
																end
													else
														step 'I click on "windows_start.png"'
														step 'I type "enps"'
														step 'I use RETURN'
													end
	#=end
	#            step 'I click on "ENPS.png" if exists'
	#            step 'I click on "ENPSRed.png" if exists'
=begin
							if (@screen.exists "ENPSDuoTaskbar.png")
									step 'I click on "taskbarActiveX.png"'
									step 'I should see "'+bigtedsitelogo+'" with high accuracy "0.87"'
									step 'I click on "max.png" if exists'
									if (objectsection== "CLIP")
										step 'I click on "CLIP.png"'
									elsif (objectsection=="CG")
										step 'I click on "CG.png"'
									elsif (objectsection=="MOSART")
										step 'I click on "MOSART.png"'
									end
								break
							elsif (@screen.exists "taskbarENPS.png")
									step 'I click on "taskbarENPS.png"'
							else
								fail "can't find image.!"
							end

=end
              step 'I should see either "enps_start.png" or "enps_start2.png"'
							step 'I click on "enps_start.png"'
							step 'I rightclick "3" pixels to the "topleft" of "mediacontrolenps.png"'
							step 'I wait "1" seconds'
							puts enpsbigtedsel
							puts bigtedsitelogo
							step 'I click on "'+enpsbigtedsel+'"'
							step 'I wait for "'+bigtedsitelogo+'" to appear'
							step 'I click on "max.png" if exists'

							if (objectsection== "CLIP")
								step 'I click on "CLIP.png"'
							elsif (objectsection=="CG")
								step 'I click on "CG.png"'
							elsif (objectsection=="MOSART")
								step 'I click on "MOSART.png"'
							end

						break
							end
				end
  end
  rescue
    puts "#{objectsection} section open in #{site} has Failed"
  end
end



###################################################################
# Close Active X

Then (/^I close BigTed Active X$/) do
  begin
		if (@screen.exists "ENPSRed.png")
			step 'I click on "ENPSRed.png"'
			if (@screen.exists "ENPSDuoTaskbar.png")
				step 'I click on "taskbarActiveX.png"'
				step 'I use Alt F4'
			else
				fail ("No Active X session opened")
			end
		elsif (@screen.exists "ENPS.png")
				step 'I click on "ENPS.png"'
				if (@screen.exists "ENPSDuoTaskbar.png")
					step 'I click on "taskbarActiveX.png"'
					step 'I use Alt F4'
				else
					fail ("No Active X session opened")
				end
		end
	#  step 'I click on "ENPSRed.png" if exists'
	#  step 'I click on "ENPS.png" if exists'
	#  if (@screen.exists "ENPSDuoTaskbar.png")
	#    step 'I click on "taskbarActiveX.png"'
			#step 'I click "100" pixels to the "topright" of "ENPS.png"'
	#    step 'I use Alt F4'
	#  else
	#    fail ("No Active X session opened")
	#  end
  rescue
    puts "I close BigTed Active X has Failed"
  end
end

###################################################################
##Timecode settings HMS or HMSF

Given (/^timecode is set to "([^"]*)"$/) do |timecodeformat|
  begin
		if(timecodeformat == "hms")
			step 'I click on "Settings.png"'
				if (@screen.exists "tickedframe.png")
					step 'I click on "tickedframe.png"'
				else
					puts 'Only showing HMS'
				end
		elsif (timecodeformat == "hmsf")
			step 'I click on "Settings.png"'
				if (@screen.exists "untickframe.png")
					step 'I click on "untickframe.png"'
				else
					puts 'Showing HMSF'
				end
    end
  rescue
  	puts "timecode is set to #{timecodeformat} has Failed"
  end

end

###################################################################
## Navigation between tabs CG, Mosart, Clip

Given (/^I open "([^"]*)" tab$/) do |opentab|
	begin
		if (opentab == "CLIP")
			if $site == "BC_PQ_QA"
				step 'I click on "CLIP.png"'
				step 'I should see either "FindContaining_airspeed.png" or "backtosearch_airspeed.png"'
				puts "CLIP Tab open"
			else
				step 'I click on "CLIP.png"'
				step 'I should see either "FindContaining.png" or "backtosearch.png"'
				puts "CLIP Tab open"
			end	
		elsif (opentab == "CG")
			step 'I click on "CG.png"'
			step 'I should see either "cgstyle.png" or "cgcode.png"'
			puts "CG Tab open"
		elsif (opentab == "MOSART")
			step 'I click on "MOSART.png"'
			step 'I should see "mosartset.png" with high accuracy "0.87"'
			puts "MOSART Tab open"
		end
		if (@screen.exists "max.png")
			step 'I click on "max.png"'
			#step 'I doubleclick on "ENPSActiveXBar.png"'
		end
  rescue
    puts "I open #{opentab} has Failed"
  end

end

###################################################################

Given (/^CG set to home style$/) do
  begin
		steps %Q{
			And I click on "CG.png"
			And I click on "selecthomestyle.png"
		}
  rescue
    puts "CG set to home style has Failed"
  end

end

Then (/^I test$/) do
	begin
			stuff=@screen.find("Error_Console.png").right(400).text()
		puts stuff
  rescue
    puts "I test has fialed"
  end

end


Given(/^I should see the follwing items on the page:$/) do |table|
	begin
			table.hashes.each do |line|
			steps %Q{
				Then I should see "#{line['Image']}" with high accuracy "0.79"
			}
      end
  rescue
    puts "I should see the follwing items on the page: has Failed"
  end

end

When (/^I set "(.*?)" as "(.*?)"$/) do |tcfield, timecode|
  begin
			if (tcfield.downcase == "in time")
				#step 'I use TAB'
				step 'I click "65" pixels to the "bottom" of "cgintime.png"'
			elsif (tcfield.downcase == "duration")
				step 'I click "65" pixels to the "bottom" of "cgduration.png"'
			elsif (tcfield.downcase == "out time")
				step 'I click "65" pixels to the "bottom" of "cgouttime.png"'
			elsif (tcfield.downcase == "relative to start") || (tcfield.downcase == "absolute time of day")
				step 'I click "50" pixels to the "bottom" of "occursat.png"'
			elsif (tcfield.downcase == "mosart duration")
				step 'I click "50" pixels to the "bottom" of "duration.png"'
			end
			step 'I use the BACKSPACE "8" times'
			step 'I type "'+timecode+'"'
			step 'I use RETURN'
  rescue
    puts "I set #{tcfield} as #{timecode} has Failed"
  end

 end


###################################################################
#### Code to support Object to ENPS integration
#### Code to support validation of MOS object
###################################################################

Then (/^I copy object$/) do
  begin
		if (@screen.exists "copyitemenps.png")
			step 'I click on "copyitemenps.png"'
			sleep(2)
			step 'I click on "copyitemenps.png"'
			sleep(2)
			step 'I click on "copyitemenps.png"'
		elsif (@screen.exists "newscript.png") || (@screen.exists "saveasicontoolbar.png")
			step 'I type CTRL C'
		else
			fail ("Cannot copy any object!!!")
		end
		sleep(1)
  rescue
    puts "I copy object has Failed"
  end

end

###########################################################################################################################################

Then (/^I check mos clip object xml:zzz$/) do |table|
  begin
		xmlenps = Clipboard.paste.encode('UTF-8').strip
		xml_doc = Nokogiri::XML(xmlenps)
		table.hashes.each do |line|
			field = line ['field']
			subfield = line ['subfield']
			value = line ['value']

			if field == "objSlug"
				case $searchclip
					when "clipname1"
						value = $clipA
					when "clipname2"
						value = $clipB
					when "clipname3"
						value = $clipC
					when "clipname4"
						value = $clipD
				end
			end

			puts field
			puts subfield
			puts value
			#binding.pry
			if field =~ /field/
				xml_doc.to_s.split("<fields>")[1].split("</fields>")[0].split("<field name=").each do |item|
					#puts item.to_s
					if item.to_s.include? value
						xml_value = value
						puts xml_value
					end
				end
			else
				xml_value = xml_doc.to_s.split("<#{field}>")[1].split("</#{field}>")[0].gsub("<b>","").gsub("</b>","")
				puts xml_value
			end
    end
  rescue
    puts "I check mos clip object xml:zzz has Failed"
  end
end

Then (/^I check mos clip object xml:$/) do |table|
  begin
		xmlenps = Clipboard.paste.encode('UTF-8').strip
		#puts "--#{xmlenps}--"
		if xmlenps.chars.first == "["
			puts "MOS from ENPS, found start ["
			xmlenps.slice!(0)
			#puts xmlenps
		else
			puts "MOS from ENPS, cannot find start ["
		end
		if xmlenps[xmlenps.length - 1] == "]"
			puts "MOS from ENPS, found end ] "
			xmlenps.chop!
			#puts xmlenps
		else
			puts "MOS from ENPS, cannot find ] end"
		end
			xml_doc = Nokogiri::Slop(xmlenps)
			table.hashes.each do |line|
				field = line ['field']
				subfield = line ['subfield']
				value = line ['value']
				if field == "objSlug"
						case $searchclip
						when "clipname1"
							value = $clipA
						when "clipname2"
							value = $clipB
						when "clipname3"
							value = $clipC
						when "clipname4"
							value = $clipD
					end
				end

				puts field
				puts subfield
				puts value

				begin
				if field == "mosAbstract"
					 xml_value = xml_doc.mos.ncsItem.item.search("#{field}").search("#{subfield}").last.content
					#xml_value = xml_doc.mos.ncsItem.item.search("#{field}").search("#{subfield}").first.content
				else
					#puts "This is a copy from BigTED"
					xml_value = xml_doc.mos.ncsItem.item.search("#{field}").first.content
				end
			rescue
				#puts "This is a copy from ENPS not from BigTED"
					xml_value = xml_doc.mos.search("#{field}").first.content
			end
				if (xml_value != value) && (field == "itemTiming") || (field == "itemEdDur") || (field =="itemUserTimingDur")
						getframe = xml_value.to_i - value.to_i
						if getframe.abs > 10 #set allowance on Frame ERROR
							fail ("Unexpected XML Frame Value, expecting '#{value}' in '#{field}' but found '#{xml_value}'")
						else
							puts "XML Frame Value, expecting '#{value}' in '#{field}' but found '#{xml_value}', Differece is '#{getframe}' frames"
						end
				elsif xml_value != value
					fail ("Unexpected XML Value, expecting '#{value}' in '#{field}' but found '#{xml_value}'")
				else
					puts "MOS xml value matches expecting '#{value}' in '#{field}'"
				end
      end
	rescue
		puts "I check mos clip object xml: has Failed"
	end
 end



###########################################################################################################################################

Then (/^I check mos CG object xml:zzz$/) do |table|
  begin
		xmlenps = Clipboard.paste.encode('UTF-8').strip
		xml_doc = Nokogiri::XML(xmlenps)
		table.hashes.each do |line|
			field = line ['field']
			subfield = line ['subfield']
			value = line ['value']

			puts field
			puts subfield
			puts value
		#binding.pry
			if field =~ /field/
				xml_doc.to_s.split("<fields>")[1].split("</fields>")[0].split("<field name=").each do |item|
					#puts item.to_s
					if item.to_s.include? value
						xml_value = value
						puts xml_value
					end
				end
			else
				xml_value = xml_doc.to_s.split("<#{field}>")[1].split("</#{field}>")[0].gsub("<b>","").gsub("</b>","")
				puts xml_value
			end
		end
  rescue
    puts "I check mos CG object xml:zzz has Failed"
  end
end

 Then (/^I check mos CG object xml:$/) do |table|
   begin
		xmlenps = Clipboard.paste.encode('UTF-8').strip
		#puts "--#{xmlenps}--"
		if xmlenps.chars.first == "["
			puts "MOS from ENPS, found start ["
			xmlenps.slice!(0)
			#puts xmlenps
		else
			puts "MOS from ENPS, cannot find start ["
		end
		if xmlenps[xmlenps.length - 1] == "]"
			puts "MOS from ENPS, found end ] "
			xmlenps.chop!
			#puts xmlenps
		else
			puts "MOS from ENPS, cannot find ] end"
		end
		xml_doc = Nokogiri::Slop(xmlenps)
		#xml_doc = Nokogiri::XML(xmlenps)
		#binding.pry

			table.hashes.each do |line|
				field = line ['field']
				subfield = line ['subfield']
				value = line ['value']


				puts field
				puts subfield
				puts value

				begin
					if field == "mosAbstract" || field == "abstract"
						puts "first mosAbstract / abstract check"
						### This is the code the check the value in the <b></b>tag within mosAbstract #####
						 #binding.pry
						 if subfield == "b"
							xml_value = xml_doc.mos.ncsItem.item.search("#{field}").search("#{subfield}").last.content
						 else
							xml_temp = xml_doc.mos.ncsItem.item.search("#{field}").children.text.strip
							xml_value = xml_temp.split("\n")[1].strip
						 end
						#xml_value = xml_doc.mos.ncsItem.item.search("#{field}").search("#{subfield}").first.content

					elsif field =~ /field/
						puts "second field check"


						### This is the code the check the value in each field tag within mosPayload #####
						xml_doc.mos.ncsItem.item.mosExternalMetadata.mosPayload.mosarttemplate.search("field").each do |item|
							puts value
							puts item.to_s
							if item.to_s.include? value
								xml_value = value
							end
						end

					else
						puts "other check"
						#### For all other elements, the value in each tag will be check against the value specified in table of the Feature file using nokogiri #####
						#puts "This is a copy from BigTED"
						xml_value = xml_doc.mos.ncsItem.item.search("#{field}").first.content

					end
				rescue
					#### For Re-edit CG object, the MOS copied from ENPS will not contain ncsItem tag , each value in each tag will be check against the value specified in table of the Feature file using nokogiri #####
					#puts "This is a copy from ENPS not from BigTED"

					if field == "mosAbstract" || field == "abstract"
						### This is the code the check the value in the <b></b>tag within mosAbstract #####
						if subfield == "b"
						 xml_value = xml_doc.mos.search("#{field}").search("#{subfield}").last.content
						else
						 xml_temp = xml_doc.mos.search("#{field}").children.text.strip
						 xml_value = xml_temp.split("\n")[1].strip
						end

					elsif field =~ /field/
						puts "second field check RESCUE"

					### This is the code the check the value in each field tag within mosPayload #####
						xml_doc.mos.mosExternalMetadata.mosPayload.mosarttemplate.search("field").each do |item|
							puts value
							puts item.to_s
							if item.to_s.include? value
								xml_value = value
							end
						end

					else

						xml_value = xml_doc.mos.search("#{field}").first.content
						#xml_value = xml_doc.to_s.split("<#{field}>")[1].split("</#{field}>")[0]
						puts xml_value
					end
				end

				if (xml_value != value) && (field == "itemTiming") || (field == "itemEdDur") || (field == "itemUserTimingDur")
							getframe = xml_value.to_i - value.to_i
							if getframe.abs > 10 #set allowance on Frame ERROR
								fail ("Unexpected XML Frame Value, expecting '#{value}' in '#{field}' but found '#{xml_value}'")
							else
								puts "XML Frame Value, expecting '#{value}' in '#{field}' but found '#{xml_value}', Differece is '#{getframe}' frames"
							end
				elsif xml_value != value
						fail ("Unexpected XML Value, expecting '#{value}' in '#{field}' but found '#{xml_value}'")
				else
						puts "MOS xml value matches expecting '#{value}' in '#{field}'"
				end

			end
	 rescue
		 puts "I check mos CG object xml: has Failed"
	 end
end

###########################################################################################################################################
Then (/^I check mos MOSART object xml:zzz$/) do |table|
  begin
		xmlenps = Clipboard.paste.encode('UTF-8').strip
		xml_doc = Nokogiri::XML(xmlenps)
		if (!xml_doc)
			xml_doc = " "
		end
		table.hashes.each do |line|
			field = line ['field']
			subfield = line ['subfield']
			value = line ['value']

			#puts field
			#puts subfield
			#puts value
			#binding.pry
			if field =~ /field/
				xml_doc.to_s.split("<fields>")[1].split("</fields>")[0].split("<field name=").each do |item|
					#puts item.to_s
					if item.to_s.include? value
						xml_value = value
						puts xml_value
					end
				end
			else
				xml_value = xml_doc.to_s.split("<#{field}>")[1].split("</#{field}>")[0].gsub("<b>","").gsub("</b>","")
				puts xml_value
			end
		end
	rescue
		puts "I check mos MOSART object xml:zzz has Failed"
	end
end

Then (/^I check mos MOSART object xml:$/) do |table|
  begin
			xmlenps = Clipboard.paste.encode('UTF-8').strip
			puts "--#{xmlenps}--"
			if xmlenps.chars.first == "["
				puts "MOS from ENPS, found start ["
				xmlenps.slice!(0)
				#puts xmlenps
			else
				puts "MOS from ENPS, cannot find start ["
			end
			if xmlenps[xmlenps.length - 1] == "]"
				puts "MOS from ENPS, found end ] "
				xmlenps.chop!
				#puts xmlenps
			else
				puts "MOS from ENPS, cannot find ] end"
			end

				xml_doc = Nokogiri::Slop(xmlenps)

				table.hashes.each do |line|
					field = line ['field']
					subfield = line ['subfield']
					value = line ['value']

					puts field
					puts subfield
					puts value
			begin

				if field == "mosAbstract"

					### This is the code the check the value in the <b></b>tag within mosAbstract #####

					 xml_value = xml_doc.mos.ncsItem.item.search("#{field}").search("#{subfield}").last.content

			elsif (field == "type") || (field == "variant") || (field == "transition")

			#### This check the name of type, variant and transition within <mosarttemplate> ###
				name = xml_doc.mos.ncsItem.item.mosExternalMetadata.mosPayload.mosarttemplate.css("#{field}")
				xml_value = name.to_s.split("<#{field} name=\"")[1].split('">')[0]


			elsif field =~ /field/

			### This is the code the check the value in each field tag within mosPayload #####
				xml_doc.mos.ncsItem.item.mosExternalMetadata.mosPayload.mosarttemplate.search("field").each do |item|

					if item.to_s.include? value
						xml_value = value
					end
				end

			else

				#### For all other elements, the value in each tag will be check against the value specified in table of the Feature file using nokogiri #####
				#puts "This is a copy from BigTED"
				xml_value = xml_doc.mos.ncsItem.item.search("#{field}").first.content

			end
		rescue
			#### For Re-edit MOSART object, the MOS copied from ENPS will not contain ncsItem tag , each value in each tag will be check against the value specified in table of the Feature file using nokogiri #####
			#puts "This is a copy from ENPS not from BigTED"

			if field == "mosAbstract"

				### This is the code the check the value in the <b></b>tag within mosAbstract #####

				 xml_value = xml_doc.mos.search("#{field}").search("#{subfield}").last.content


			elsif field =~ /field/

			### This is the code the check the value in each field tag within mosPayload #####
				xml_doc.mos.mosExternalMetadata.mosPayload.mosarttemplate.search("field").each do |item|

					if item.to_s.include? value
						xml_value = value
					end
				end

			elsif (field == "type") || (field == "variant") || (field == "transition")

			#### This check the name of type, variant and transition within <mosarttemplate> ###
				name = xml_doc.mos.mosExternalMetadata.mosPayload.mosarttemplate.css("#{field}")
				xml_value = name.to_s.split("<#{field} name=\"")[1].split('">')[0]

			else

			xml_value = xml_doc.mos.search("#{field}").first.content

			end
		end

				if xml_value != value

					fail ("Unexpected XML Value, expecting '#{value}' in '#{field}' but found '#{xml_value}")

				else
					puts "MOS xml value matches expecting '#{value}' in '#{field}'"
				end

	end
	rescue
		puts "I check mos MOSART object xml: has Failed"
	end
end

###########################################################################################################################################

When (/^I paste object in ENPS$/) do
   begin
		userfolder = $userfolder
	#=begin

		if (@screen.exists "ENPS.png")
			puts "ENPS exists"
			step 'I click on "ENPS.png"'
				if (@screen.exists "ENPSDuoTaskbar.png")
					step 'I click on "taskbarENPS.png"'
				else
					fail ("Exepecting Big Ted Active X running!")
				end
		elsif (@screen.exists "ENPSRed.png")
			puts "ENPS Red exists"
			step 'I click on "ENPSRed.png"'
			if (@screen.exists "ENPSDuoTaskbar.png")
				step 'I click on "taskbarENPS.png"'
			else
				fail ("Exepecting Big Ted Active X running!")
			end
		else
			fail "Cannot find ENPS session!!"
		end
=begin
			step 'I click on "ENPS.png" if exists'
			step 'I click on "ENPSRed.png" if exists'
			if (@screen.exists "ENPSDuoTaskbar.png")
				step 'I click on "taskbarENPS.png"'
			else
				fail ("Exepecting Big Ted Active X running!")
			end
=end
			step 'I should see "'+userfolder+'" with high accuracy "0.87"'
			step 'I rightclick "2" pixels to the "topleft" of "'+userfolder+'"'
			step 'I should see either "new.png" or "newred.png"'
			step 'I click on "newred.png"'
			step 'I click on "script.png"'
			step 'I should see "newscript.png" with high accuracy "0.79"'
			step 'I click on "newscript.png"'
			step 'I click "30" pixels to the "bottom" of "editortoolbar.png"'
			step 'I click on "paste.png"'
			step 'I use RETURN'
			step 'I use RETURN'
	 rescue
		 puts "I paste object in ENPS has Failed"
	 end
end


Then (/^I check in ENPS to verify "(.*?)" object$/) do |bigtedobject|
  begin
		step 'I should see "newscript.png" with high accuracy "0.79"'
		if (bigtedobject == "CLIP")
			step 'I can see "'+$clipitemarray+'"'
		elsif (bigtedobject == "CG")
			step 'I can see "'+$cgitemarray+'"'
		elsif (bigtedobject == "CG integration")
			step 'I can see "'+$cgintegrationarray+'"'
		elsif (bigtedobject == "MOSART")
			step 'I can see "'+$mosartintegrationarray+'"'

		end
  rescue
    puts "I check in ENPS to verify #{bigtedobject} object has Failed"
  end

end

##############################################################################################################################
Then (/^I cancel edit$/) do
  begin
		if !(@screen.exists "canceledit.png")
			fail ("Error, no edit to cancel")
		else
			step 'I click on "canceledit.png"'
    end
  rescue
    puts "I cancel edit has Failed"
  end

end

Then (/^I save edit$/) do
  begin
		if !(@screen.exists "saveedit.png")
			fail ("Error, no edit to save")
		else
			step 'I click on "saveedit.png"'
    end
  rescue
    puts "I save edit has Failed"
  end

end


##############################################################################################################################

Then (/^I close all scripts$/) do
  begin
		if (@screen.exists "ENPSRed.png")
			step 'I click on "ENPSred.png"'
				if (@screen.exists "ENPSDuoTaskbar.png")
						step 'I click on "taskbarENPS.png"'
				else
					fail ("Exepecting Big Ted Active X running!")
				end
			step 'I should see "saveasicontoolbar.png" with high accuracy "0.87"'
			step 'Within region "activescriptwindow.png" click "closescript.png"'
				if (@screen.exists "savechanges.png")
					step 'I click on "no.png"'
				end
		elsif (@screen.exists "ENPS.png")
			step 'I click on "ENPS.png"'
				if (@screen.exists "ENPSDuoTaskbar.png")
						step 'I click on "taskbarENPS.png"'
				else
					fail ("Exepecting Big Ted Active X running!")
				end
			step 'I should see "saveasicontoolbar.png" with high accuracy "0.87"'
			step 'Within region "activescriptwindow.png" click "closescript.png"'
				if (@screen.exists "savechanges.png")
					step 'I click on "no.png"'
				end
    end
  rescue
    puts "I close all scripts has Failed"
  end

end

##############################################################################################################################
##############################################################################################################################

Given (/^a "(.*?)" object exists in a running order$/) do |runningorderobject|
	begin
		if (runningorderobject == "CLIP")
			step 'I can see "'+$clipitemarray+'"'
		elsif (runningorderobject == "CG")
			step 'I can see "'+$cgitemarray+'"'
		elsif (runningorderobject == "CG integration")
			step 'I can see "'+$cgintegrationarray+'"'
		elsif (runningorderobject == "MOSART")
			step 'I can see "'+$mosartintegrationarray+'"'
    end
  rescue
    puts "a #{runningorderobject} object exists in a running order has failed"
  end

end

=begin
Given (/^a "(.*?)" object exists in a running order$/) do |runningorderobject|

	if (runningorderobject == "CLIP")
		step 'I can see "'+$clipitemarray+'" and doubleclick'
	elsif (runningorderobject == "CG")
		step 'I can see "'+$cgitemarray+'" and doubleclick'
	elsif (runningorderobject == "CG integration")
		step 'I can see "'+$cgintegrationarray+'" and doubleclick'
	elsif (runningorderobject == "MOSART")
		step 'I can see "'+$mosartintegrationarray+'" and doubleclick'
	end
end
=end

When (/^I view "(.*?)" object$/) do |viewobject|
	begin
		if (viewobject == "CLIP")
			#clipitemarray = $clipAinenps + "," + $clipBinenps + "," + $clipCinenps + "," + $clipDinenps + "," + $clipAinenpsH
			step 'I can see "'+$clipitemarray+'" and doubleclick'
		elsif (viewobject == "CG")
			step 'I can see "'+$cgitemarray+'" and doubleclick'
		elsif (viewobject == "CG integration")
			step 'I can see "'+$cgintegrationarray+'" and doubleclick'
		elsif (viewobject == "MOSART")
			step 'I can see "'+$mosartintegrationarray+'" and doubleclick'
		end
		step 'I click on "max.png" if exists'
  rescue
    puts "I view #{viewobject} object has Failed "
    end
end


##############################################################################################################################
##############################################################################################################################
#####################################################################################################################################################
##### MISC code#####
###################################################################################################################################################

Given(/^I open a new notepad session$/) do
  begin
		if !@screen.exists "taskbar_notepad.png"
			step 'I click on "windows_start.png"'
			step 'I wait for "1" seconds'
			step 'I type "notepad"'
			step 'I use RETURN'
			step 'I wait for "notepad_top.png" to appear'
		else
			step 'I click on "taskbar_notepad.png" until "notepad_top.png" appears'
			step 'I click on "notepad_top.png"'
			step 'I use CTRL A'
			step 'I use BACKSPACE'
    end
  rescue
    put "I open a new notepad session has Failed"
  end

end
