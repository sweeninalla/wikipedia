#Starts the driver
Before do
  if $start_driver
    Driver.instance.start_app
    $start_driver = false
  end
end

#After scenario hooks

After do |s|
  if s.failed?
    file_name = 'wikipedia' + common.random_string
    # Take screenshot saving file as the n file name
    Driver.instance.screenshot File.join(Dir.pwd, "#{file_name}.png")
    embed("#{file_name}.png", 'image/png', 'SCREENSHOT')
  end
  Driver.instance.reset
end

#exit the webdriver at the end of test run
at_exit do
  Driver.instance.stop_app
end