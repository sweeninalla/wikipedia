 require 'macaddr'
# GEMFILE_LOCAL = '/Users/sna15/.rvm/gems/ruby-2.1.1/gems'.freeze

# def use_local_gemfile
#   "BUNDLE_GEMFILE=#{GEMFILE_LOCAL}"
# end
#
# desc 'Install all dependencies'
# task :dependencies do
#   sh 'bundle install'
#   sh "#{use_local_gemfile} bundle install"
# end
#
# desc 'Update all dependencies'
# task :update_dependencies do
#   sh 'bundle update'
#   sh "#{use_local_gemfile} bundle update"
# end


task :start_appium do
  Rake::Task["stop_appium"].invoke
  appium_command="appium #{ENV['APPIUM_PARAMETERS']}"
  puts "Appium Command: #{appium_command}"
  Process.spawn(appium_command)

  puts 'SUCCESS: Appium started'
end

task :stop_appium do
  `killall -9 node`
  puts 'SUCCESS: Appium stopped'
end



