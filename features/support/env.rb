
require 'rspec'
require 'active_support/deprecation'
require 'active_support/dependencies'
require 'selenium-webdriver'
require 'appium_lib'
require 'cucumber'




#Global variables can be accessed from anywhere in the project
# $take_screenshot = false || ENV['SCREEN_SHOT']
$package  = 'org.wikipedia'
# if ENV['TAB'].downcase =='true'
#   $tab = true
# else
#   $tab = false
# end

$start_driver = true

def driver
  Driver.instance.driver
end

def wait
  @wait ||= Selenium::WebDriver::Wait.new(:timeout => 90)
end

def common
  @common ||= Common.new
end



