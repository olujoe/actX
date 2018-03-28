#############################################################
# Environment file for Big Ted Active X
# Written by Brian Tsang
##########################################################################

require 'java'
require 'sikuli'
#require 'D:/Projects/Jupiter/Tools/SikuliX/sikuli-script.jar'

require 'clipboard'
require 'rubygems'
#require 'watir-webdriver'
require 'uri'
require 'open-uri'
require 'net/http'
require 'net/https'
require 'JSON'
require 'nokogiri'
require 'rspec'
#require 'test_xml/spec'
require 'yaml'
require 'testrail'
require 'pry'
require 'rest-client'

#require 'win32/screenshot'
#require 'mini_magick'
#require 'win32/screenshot'
#require 'capybara'


#ENV['debug'] = "true"
$config = YAML.load(File.read('features/config/config.yml'))


Pry.config.input = STDIN
Pry.config.output = STDOUT

Sikuli::Config.run do |config|
  config.image_path = "#{Dir.pwd}/features/images/"
  config.logging = true
  config.highlight_on_find = true
end



class SikuliNavigator
  def initialize
    #if (defined?(@screen)).nil?
    #    @screen.destroy()
    #end
    @screen = Sikuli::Screen.new                  # from the sikuli gem
    #puts "************************************************"

    #resultRegion = @screen.exists("images\\result_region.png")
    #@resultRegion = resultRegion.below()

    #resultRegion = @screen.exists("images\\result_region.png")
    #@qvlRegion = resultRegion.above()

  end
end

World { SikuliNavigator.new }


After do |scenario|

    if scenario.failed?
      #if ENV['FAIL_FAST']
      Cucumber.wants_to_quit = true if scenario.failed? 
    end
end
