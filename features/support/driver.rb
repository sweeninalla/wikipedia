require 'singleton'
require 'appium_lib'
require 'selenium-webdriver'

class Driver
  include Singleton

  attr_reader :driver


  KEYCODE_HOME = 3
  KEYCODE_ENTER = 66
  KEYCODE_TAB = 61
  KEYCODE_APP_SWITCH = 187
  KEYCODE_SPACE = 62
  KEYCODE_APOSTOPHE = 75


  def initialize
    @driver=nil
  end

  $port = ENV['PORT'] || 4723

  def start_app(older_app=false)
    # start_time=Time.now
    # app -give the path where the apk is stored
    # udid -give the device id where we'r executing script -we can get device id by running command ' adb devices'
    @capabilities = {
        caps: {
            'autoLaunch' => true,
            'platformName' => 'Android',
            'deviceName' => 'Android',
            'browserName' => '',
            'app' => '/Users/sna15/wikipedia/wikipedia-2.4.160-releasesprod-2016-10-14.apk',
            'newCommandTimeout' => 60,
            'udid' => '9a97b94f'
        }
    }

    begin
      #puts "capabilies are #{@capabilities}"
      @driver = Appium::Driver.new(@capabilities)
      @driver.start_driver
      # set_wait 10
      # @driver = Appium::Driver.new(@capabilities).start_driver
      Appium.promote_appium_methods Object

    rescue Exception => e
      puts 'ERROR: Starting Webdriver.  Possible causes:'
      puts ' * Appium server is down/unreachable'
      puts ' * Appium and Device/Simulator have different sessions'
      puts ' * The Binary Server is down/unreachable (Jenkins)'

      raise e
    end
  end

  # def restart_app
  #   @driver = @driver.restart
  # end

  def stop_app
    begin
      @driver.driver_quit
    rescue
      # do nothing
    end

    @driver=nil
  end


end



