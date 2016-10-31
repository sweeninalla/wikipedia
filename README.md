# wikipedia


BDD Mobile Test Framework - Appium, Cucumber, Ruby

## 1.0 Prerequisites
* You're using a MAC.
* Android SDK downloaded*


*Android SDK can be downloaded from https://developer.android.com/sdk/index.html. Minimum requirement is the `.zip` under SDK Tools Only, but you can install the Android Studio bundle if you like.

## 2.0 Setup your environment
Note: This assumes you're starting from scratch on a new MAC. Steps may/may not be required or may need to be altered if you already have a development environment set up.

### 2.1 Install brew

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor

### 2.2 Install ruby 2.1.1
Note: You can install ruby 2.1.1 however you like, as long as that is the version of ruby that is used when running the tests. One of the most common methods is to use RVM, however the method shown here works just as well.

    brew install chruby
    brew install ruby-build
    ruby-build 2.1.1 ~/.rubies/2.1.1

### 2.3 Set up your bash_profile
Make sure you're in your Home directory

    cd ~

Create your bash profile (unnecessary step if you already have one, check first by running `ls -lA`)

    touch .bash_profile

Open the bash profile

    open .bash_profile

Add the following to your bash profile. This will set your terminal to use Ruby 2.1.1 by default.

    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/opt/chruby/share/chruby/auto.sh
    chruby 2.1.1
Also add the location of your copy of the Android SDK to the bash profile. e.g.

    export ANDROID_HOME="/Users/Umar/development/adt-bundle-mac-x86_64-20140321/sdk"

Save the file, then completely kill then re-open the Terminal.

Check that the default version is 2.1.1

    ruby -v
### 2.4 Set up your PATH
Open your PATH

    sudo pico /etc/paths

Add the following
'[android sdk location]' should be replaced by the full path of your local Android SDK

    [android sdk location]/build-tools
    [android sdk location]/platform-tools
    [android sdk location]/tools

### 2.5 Install appium
This will install the command line version of appium. If you want, you can download the GUI version from the appium website (comes in very useful for getting XPATH of elements from iOS apps).
At the time of writing, the framework and dependencies work with Appium version 1.4.0

    brew install node
    npm install -g appium@1.5.0
    npm install wd
    
### 2.6 The project and dependencies
Setup your ssh keys: https://help.github.com/articles/generating-ssh-keys/

Clone the framework

    git clone https://github.com/wikipedia.git

Navigate to the framework directoy

 example the app is in wikipedia directory
 cd wikipedia

Install bundler and the gems the framework is dependent on

    gem install bundler

    
### 2.7 Potential setup problems
* Nokogiri - if during the 'bundle install' step in section 2.6, you encounter a problem with xcode and Nokogiri, run the following command `xcode-select --install`


## 3.0 Running tests
Prerequisites: 
* The Appium server should be running, either from terminal `appium` or GUI.
* Build should be in the directory,

## Then run app using command in terminal
bundle exec cucumber -p default --tags @android

## with in cucumber.yml,I've added @android tag for default
when executing scripts in feature file it will look for tag with @android and execute only those sceanarios
I've added @android tag for features files to execute and added profile to cucmber.yml

## Between every scenarios,have added reset the data in cucumber.yml  so when running the app it will delete and restart app for every scenarios.
## Driver.rb file,for capabilities
'app' => '/Users/sna15/wikipedia/wikipedia-2.4.160-releasesprod-2016-10-14.apk',(give the app path where the apk is stored.
'udid' => '9a97b94f'(this is device id to provide so the test execution will process)
simply you get device id by running the command
'adb devices'



## cucumber.yml -for deafult profile added the following
default: -t @android RESET_BETWEEN_SCENARIOS=1 -f html -o execution_result.html SCREEN_SHOT=false TAB=false --format progress

--format progress -is it run thge sceanrios and shows number of test passed and failed
please check test_report.pngin project directory


