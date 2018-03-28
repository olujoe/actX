

When /^I drag "(.*?)" to "(.*?)"$/ do |bitmap, destination|
	begin
      @screen.wait "#{bitmap}", 10
      puts "#{bitmap} exists"
      @screen.wait "#{destination}", 1
      puts "#{destination} exists"
	    if @screen.exists "#{bitmap}"
			  @screen.dragDrop("#{bitmap}",destination)
	    end
  rescue
      puts "I drag #{bitmap} to #{destination} has Failed"
    	fail("The following bitmap cannot be found: " + bitmap)
  end
end



When /^I use SPACE "(.*?)" times$/ do |num|
  begin
  num.to_i.times do 
  @screen.type(Sikuli::SPACE)
  end
  rescue
    puts "I use SPACE #{num} times has Failed"
  end
end

When /^I use TAB "(.*?)" times$/ do |num|
  begin
  num.to_i.times do
  @screen.type("\t")
  end
  rescue
    puts "I use TAB #{num} times has Failed"
  end
end

When /^I use the DOWNARROW "(.*?)" times$/ do |num|
  begin
  num.to_i.times do
    @screen.type(Sikuli::DOWNARROW)
  end
  rescue
    puts "I use the DOWNARROW #{num} times has Faield"
  end
end

When /^I use the UPARROW "(.*?)" times$/ do |num|
  begin
  num.to_i.times do
    @screen.type(Sikuli::UPARROW)
  end
  rescue
    puts "I use the UPARROW #{num} times has Fialed"
  end
end

When /^I use Up$/ do
  begin
    @screen.type(Sikuli::UPARROW)
  rescue
    puts "I use the Up has Fialed"
  end
end


When /^I use Down$/ do
  begin
    @screen.type(Sikuli::DOWNARROW)
  rescue
    puts "I use the Down ahs Failed"
  end
end


When /^I use Right$/ do
  begin
    @screen.type(Sikuli::RIGHTARROW)
  rescue
    puts "I use Right has Failed"
  end
end


When /^I use Left$/ do
  begin
    @screen.type(Sikuli::LEFTARROW)
  rescue
    puts "I use Left has Failed"
  end
end



When /^I use Alt F4$/ do
  begin
  @screen.type(Sikuli::KEY_F4, Sikuli::KEY_ALT)
  rescue
    puts "I use Alt F4 has Failed"
  end
end

When /^I type time$/ do
  begin
	if(ENV['debug'])
    	puts $currentTimeOffsetString
    end
	@screen.type "#{$currentTimeOffsetString}"
  rescue
    puts "I type time has Failed"
  end
end


When /^I type "(.*?)"$/ do |text|
  begin
  sleep(1)
	@screen.type "#{text}"
  rescue
    puts "I type #{text} has Failed"
  end
end


When /^I type "(.*?)" and TAB$/ do |text|
  begin
  @screen.type "#{text}"+ "\t"
  sleep(1)
  rescue
    puts "I type #{text} and TAB has Failed"
  end
end


When /^I use BACKSPACE$/ do
  begin
  @screen.type(Sikuli::KEY_BACKSPACE)
  rescue
    puts "I use BACKSPACE has Failed"
  end
end


When /^I use the BACKSPACE "(.*?)" times$/ do |num|
  begin
  num.to_i.times do 
    @screen.type(Sikuli::KEY_BACKSPACE)
  end
  rescue
    puts "I use SPACE #{num} times has Failed"
  end
end

When /^I use TAB$/ do
  begin
  sleep(2)
  @screen.type("\t")
  rescue
    puts "I use TAB has Failed"
  end
end


#When /^I use DOWNARROW$/ do
#  @screen.type(Sikuli::KEY_DOWN)
#  @screen.type(KEY.PAGE_DOWN)
#   @screen.type(u"\ue003")
#   @screen.type("\ue003")
#end


When /^I use CTRL A$/ do
  begin
  sleep(1)
  @screen.type("a", Sikuli::KEY_CTRL)
  sleep(1)
 #@screen.type("x", Sikuli::KEY_CTRL)
  rescue
    puts "I use CTRL A has Failed"
  end
end

When /^I use CTRL Q$/ do
  begin
  sleep(1)
  @screen.type("Q", Sikuli::KEY_CTRL)
  sleep(1)
 #@screen.type("x", Sikuli::KEY_CTRL)
  rescue
    puts "I use CTRL Q has Failed"
  end
end

When /^I use RETURN$/ do
  begin
#	And I wait "1" seconds
#    And I use CTRL A
  sleep(1)
  @screen.type("\n")
  rescue
    puts "I use RETURN has Failed"
  end
end

When /^I use DELETE$/ do
  begin
  sleep(1)
  @screen.type(Sikuli::KEY_DELETE)
  rescue
    puts "I use DELETE has Failed"
  end
end

When /^I Copy and Paste$/ do
  begin
  sleep(1)
  @screen.type("a", Sikuli::KEY_CTRL)
  sleep(1)
  @screen.type("c", Sikuli::KEY_CTRL)
  sleep(1)
  @screen.type("v", Sikuli::KEY_CTRL)
  @screen.type("v", Sikuli::KEY_CTRL)
  rescue
    puts "I copy and Paste ha s Failed"
  end
end

When /^I Clear and Paste$/ do
  begin
  sleep(1)
  @screen.type("a", Sikuli::KEY_CTRL)
  sleep(1)
#  @screen.type("x", Sikuli::KEY_CTRL)
  @screen.type(Sikuli::KEY_BACKSPACE)
  sleep(1)
  @screen.type("v", Sikuli::KEY_CTRL)
  @screen.type(Sikuli::KEY_BACKSPACE)
  rescue
    puts "I Clear and Paste has Failed"
  end
end

When /^I paste "(.*?)"$/ do |text|
  begin
  @screen.paste("#{text}")
  rescue
    puts "I paste #{text} has Failed"
  end
end

When /^I scroll to the right$/ do
  begin
  150.times do 
  @screen.type(Sikuli::RIGHT_ARROW)
  end
  rescue
    puts "I scroll to the right ahs Failed"
  end
end

When /^I type PAGE_UP$/ do
  begin
  150.times do 
  @screen.type(Sikuli::PAGE_UP)
  end
  rescue
    puts "I type PAGE UP has Failed"
  end
end

When /^I scroll to the left$/ do
  begin
  150.times do 
  	@screen.type(Sikuli::LEFT_ARROW)
  end
  rescue
    puts "I scroll ot the left has Failed"
  end
end

When /^I press the space key$/ do
  begin
  @screen.type(" ")
  rescue
    puts "I press the space key has Failed"
  end
end

Given /^I type sequence and a random 2 digit number$/ do
  begin
  text = rand(99)
  puts text
  @screen.type "sequence#{text}"
  rescue
    puts "I type sequence and a random 2 digit number has Failed"
  end
end

When /^I type F2$/ do
  begin
  @screen.type(Sikuli::KEY_F2)
  rescue
    puts "I tpe F2 has Failed"
  end
end


When /^I type F3$/ do
  begin
  @screen.type(Sikuli::KEY_F3)
  rescue
    puts "I type F3 has Failed "
  end
end


When /^I type F4$/ do
  begin
  @screen.type(Sikuli::KEY_F4)
  rescue
    puts "I type F4 has Fialed"
  end
end


When /^I type F5$/ do
  begin
  @screen.type(Sikuli::KEY_F5)
  rescue
    puts "I type F5 has Fialed"
  end
end


When /^I type F6$/ do
  begin
  @screen.type(Sikuli::KEY_F6)
  rescue
    puts "I type F6 has Fialed"
  end
end


When /^I type F7$/ do
  begin
  @screen.type(Sikuli::KEY_F7)
  rescue
    puts "I type F7 has Fialed"
  end
end

When /^I type F8$/ do
  begin
  @screen.type(Sikuli::KEY_F8)
  rescue
    puts "I type F8 has Fialed"
  end
end

When /^I type F9$/ do
  begin
  @screen.type(Sikuli::KEY_F9)
  rescue
    puts "I type F9 has Fialed"
  end
end

When /^I type F10$/ do
  begin
  @screen.type(Sikuli::KEY_F10)
  rescue
    puts "I type F10 has Fialed"
  end
end

When /^I type F11$/ do
  begin
  @screen.type(Sikuli::KEY_F11)
  rescue
    puts "I type F11 has Fialed"
  end
end

When /^I type F12$/ do
  begin
  @screen.type(Sikuli::KEY_F12)
  rescue
    puts "I type 12 has Fialed"
  end
end

When /^I type Shift F3$/ do
  begin
  @screen.type(Sikuli::KEY_F3, Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift F3 has Fialed"
  end
end

When /^I type Shift F4$/ do
  begin
  @screen.type(Sikuli::KEY_F4, Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift F4 has Fialed"
  end
end

When /^I type Shift F5$/ do
  begin
  @screen.type(Sikuli::KEY_F5, Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift F5 has Fialed"
  end
end

When /^I type Shift F6$/ do
  begin
  @screen.type(Sikuli::KEY_F6, Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift F6 has Fialed"
  end
end

When /^I type Shift F7$/ do
  begin
  @screen.type(Sikuli::KEY_F7, Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift F7 has Fialed"
  end
end

When /^I type Shift F8$/ do
  begin
  @screen.type(Sikuli::KEY_F8, Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift F8 has Fialed"
  end
end

When /^I type Shift F9$/ do
  begin
  @screen.type(Sikuli::KEY_F9, Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift F9 has Fialed"
  end
end

When /^I type Shift F10$/ do
  begin
  @screen.type(Sikuli::KEY_F10, Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift F10 has Fialed"
  end
end

When /^I type Shift F11$/ do
  begin
  @screen.type(Sikuli::KEY_F11, Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift F11 has Fialed"
  end
end

When /^I type Shift F12$/ do
  begin
  @screen.type(Sikuli::KEY_F12, Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift F12 has Fialed"
  end
end


When /^I type Shift J$/ do
  begin
  @screen.type("J", Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift J has Fialed"
  end
end

When /^I type Shift L$/ do
  begin
  @screen.type("l", Sikuli::KEY_SHIFT)
  rescue
    puts "I type Shift L has Fialed"
  end
end

When /^I type CTRL C$/ do
  begin
  @screen.type("c", Sikuli::KEY_CTRL)
  rescue
    puts "I type CTRL C has Fialed"
  end
end


When /^I type CTRL J$/ do
  begin
  @screen.type("J", Sikuli::KEY_CTRL)
  rescue
    puts "I type CTRL J has Fialed"
  end
end

When /^I type CTRL L$/ do
  begin
  @screen.type("l", Sikuli::KEY_CTRL)
  rescue
    puts "I type CTRL L has Fialed"
  end
end

When /^I use ESC$/ do
  begin
  @screen.type(Sikuli::KEY_ESC)
  rescue
    puts "I use ESC has Failed"
  end
end

When /^I use Home$/ do
  begin
  @screen.type(Sikuli::KEY_HOME)
  rescue
    puts "I use Home has Failed"
  end
end

When /^I use End$/ do
  begin
  @screen.type(Sikuli::KEY_END)
  rescue
    puts "I suse End has Failed"
  end
end


#When /^I wait for "(.*?)" to appear$/ do |bitmap|
#  begin
#    @screen.wait "#{bitmap}", 20
 # rescue
#    fail("The following bitmap cannot be found: " + bitmap)
#  end
#end

When /^I create a region "(.*?)"$/ do |bitmap|
  begin
  r=@screen.find "#{bitmap}".below(500)
  rescue
    puts "I create a region #{bitmap} has Failed"
  end
end

When /^I type j 20 times$/ do
  begin
  15.times do 
    @screen.type("j")
  end
  rescue
    puts "I type j 20 times has Failed"
  end
end

# Make sikuli more robust
# from org.sikuli.script.natives import Vision
#Vision.setParameter("MinTargetSize", 6) # A small value such as 6 makes the matching algorithm be faster.
#Vision.setParameter("MinTargetSize", 18) # A large value such as 18 makes the matching algorithm be more robust.

#find("OK") return all regions with ok label
#Region.text return text in a region

# Beware using this cos the application is closed automatically after the job has finished
#@script.openApp("C:\\Program Files (x86)\\BBC\\Jupiter\\bin\\Jupiter.exe")

#popup("Hello World!\nHave fun with Sikuli!")

#while @screen.exists "#{bitmap}"
#	@screen.click "#{bitmap}"
#	sleep 1
#end
#loop do @screen.click "#{bitmap}"
#	sleep 1
#	break if not (@screen.exists "#{bitmap}")
#end

#STDOUT.write "Given I click on " + bitmap + "\n"

