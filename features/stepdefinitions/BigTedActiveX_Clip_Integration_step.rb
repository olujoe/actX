#####################################################################################################################################################
##### This is the step definition that drives the Clip editorial + CG + ENPS integration test cases#####
##### Author: Brian Tsang
#####################################################################################################################################################

When (/^I mark in out via "(.*?)"$/) do |markcginout|
  begin
	if (markcginout == "cgbutton")
		step 'I click on "setcgin.png"'
		step 'I should see either "play.png" or "play2.png"'
		step 'I click on "play2.png"'
		step 'I wait "15" seconds'
		step 'I click on "pause.png"'
		step 'I click on "setcgout.png"'
		puts "Timecode enter as in 00:00:00, out 00:00:16"
	elsif (markcginout == "manualtimecode")
		step 'I click on "play2.png"'
		step 'I wait "2" seconds'
		step 'I click on "pause.png"' 
		step 'I click "25" pixels to the "top" of "editionalduration.png"'
		step 'I use the BACKSPACE "8" times'
		puts "Timecode enter as 00:00:17"
		step 'I type "17" and TAB'
		step 'I use the BACKSPACE "8" times'
		puts "Timecode enter as 00:00:46"
		step 'I type "46"'
		step 'I use RETURN'
	elsif (markcginout == "cgbuttonframe")
		step 'I click on "setcgin.png"'
		step 'I should see either "play.png" or "play2.png"'
		step 'I click on "play2.png"'
		step 'I wait "23" seconds'
		step 'I click on "pause.png"'
		step 'I click on "setcgout.png"'
		puts "Timecode enter as in 00:00:00:00, out 00:00:24:09 or 00:00:24:10"
	elsif (markcginout == "manualtimecodeframe")
		step 'I click on "play2.png"'
		step 'I wait "2" seconds'
		step 'I click on "pause.png"'
		step 'I click "25" pixels to the "top" of "editionalduration.png"'
		step 'I use the BACKSPACE "8" times'
		puts "Timecode enter as 00:01:19:04"
		step 'I type "11904" and TAB'
		step 'I use the BACKSPACE "8" times'
		puts "Timecode enter as 00:01:38:21"
		step 'I type "13821"'
		step 'I use RETURN'
  end
  rescue
    puts "I mark in out via #{markcginout} has Failed"
  end

end

Then (/^I check CG in out timecode "(.*?)"$/) do |cgtimecodecheck|
  begin
	if (cgtimecodecheck == "cgbutton")
		step 'I should see "clipcgT1.png" with high accuracy "0.89"'
		step 'I click on "CG.png"'
		step 'I should see "cgbuttonT1.png" with high accuracy "0.89"'
		puts "CG timecode from Clip tab matches"
	elsif (cgtimecodecheck == "manualtimecode")
		step 'I should see "clipcgT2.png" with high accuracy "0.89"'
		step 'I click on "CG.png"'
		step 'I should see "cgbuttonT2.png" with high accuracy "0.89"'
		puts "CG timecode from Clip tab matches"
	elsif (cgtimecodecheck == "cgbuttonframe")
		step 'I should see either "clipcgT3.png" or "clipcgTb.png"'
		step 'I click on "CG.png"'
		step 'I should see either "cgbuttonT3.png" or "cgbuttonT3b.png"'
		puts "CG timecode from Clip tab matches"
	elsif (cgtimecodecheck == "manualtimecodeframe")
		step 'I should see "clipcgT4.png" with high accuracy "0.89"'
		step 'I click on "CG.png"'
		step 'I should see "cgbuttonT4.png" with high accuracy "0.89"'
		puts "CG timecode from Clip tab matches"
  end
  rescue
    puts "I check CG in out timecode #{cgtimecodecheck} has Failed"
  end

end

When (/^I mark editorial duration via "(.*?)"$/) do |markeditorial|
  begin
	if (markeditorial == "edbutton")
		step 'I should see either "play.png" or "play2.png"'
		step 'I click on "play2.png"'
		step 'I wait "22" seconds'
		step 'I click on "pause.png"'
		step 'I click on "seteditorialduartion.png"'
		puts "Timecode enter as in 00:00:23"
	elsif (markeditorial == "manualtimecode")
		step 'I click "25" pixels to the "right" of "editionalduration.png"'
		step 'I use the BACKSPACE "6" times'
		puts "Timecode enter as 00:01:13"
		step 'I type "113" and TAB'
	elsif (markeditorial == "edbuttonframe")
		step 'I should see either "play.png" or "play2.png"'
		step 'I click on "play2.png"'
		step 'I wait "38000" milliseconds'
		step 'I click on "pause.png"'
		step 'I click on "seteditorialduartion.png"'
		puts "Timecode enter as in 00:00:39:08"
	elsif (markeditorial == "manualtimecodeframe")	
		step 'I click "25" pixels to the "right" of "editionalduration.png"'
		step 'I use the BACKSPACE "6" times'
		puts "Timecode enter as 00:00:48:13"
		step 'I type "4813" and TAB'
  end
  rescue
    puts "I mark editorial duration via #{markeditorial} has Failed"
  end

end

Then (/^I check editorial duration timecode "(.*?)"$/) do |editorialcheck|
  begin
	if (editorialcheck == "edbutton")
		step 'I should see "clipedT1.png" with high accuracy "0.87"'
		puts "Editional Duration timecode is entered as 00:00:23"
	elsif (editorialcheck == "manualtimecode")
		step 'I should see "clipedT2.png" with high accuracy "0.87"'
		puts "Editional Duration timecode is entered as 00:01:13"
	elsif (editorialcheck == "edbuttonframe")
		step 'I should see "clipedT3.png" with high accuracy "0.87"'
		puts "Editional Duration timecode is entered as 00:00:39:08"
	elsif (editorialcheck == "manualtimecodeframe")	
		step 'I should see "clipedT4.png" with high accuracy "0.87"'
		puts "Editional Duration timecode is entered as 00:00:48:13"
  end
  rescue
    puts "I check editorial duration timecode #{editorialcheck} has Failed"
  end

end

When (/^I set clip transition to "(.*?)"$/) do |setcliptransition|
  begin
	step 'I click "25" pixels to the "bottom" of "mediaduration.png"'
	if (setcliptransition == "CUT")
		step 'I use Home'
		#step 'I use RETURN'
	elsif (setcliptransition == "MIX")
		#step 'I click "25" pixels to the "bottom" of "mediaduration.png"'
		step 'I use Home'
		step 'I use Down'
		#step 'I use RETURN'
	elsif (setcliptransition == "WIPE1")
		#step 'I click "25" pixels to the "bottom" of "mediaduration.png"'
		step 'I use Home'
		step 'I use the DOWNARROW "2" times'
		#step 'I use RETURN'
	elsif (setcliptransition == "WIPE2")
		#step 'I click "25" pixels to the "bottom" of "mediaduration.png"'
		step 'I use Home'
		step 'I use the DOWNARROW "3" times'
		#step 'I use RETURN'
	elsif (setcliptransition == "iTX DEFAULT")
		#step 'I click "25" pixels to the "bottom" of "mediaduration.png"'
		step 'I use End'
	end
	step 'I use RETURN'
  rescue
    puts "I set clip transition to  #{setcliptransition} has Failed"
  end

end

When (/^I set "(.*?)" word$/) do |setword|
  begin
	if (setword == "in")
		puts "Currently running In Out Word test"
		step 'I click "35" pixels to the "right" of "inword.png"'
		steps %Q{
		And I type "#{$inword}"
    }
	elsif (setword == "out")
		step 'I click "35" pixels to the "right" of "outword.png"'
		steps %Q{
		And I type "#{$outword}"
    }
  end
  rescue
    puts "I set #{setword} word"
  end

end
		
