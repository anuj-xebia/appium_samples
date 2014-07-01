require 'rspec/expectations'
require 'selenium-webdriver'


APP_PATH = '/Users/anandsahay/Documents/appiumtests/androidCreateNote/bin/AppiumTestDummyApp.apk'
 
def absolute_app_path
  File.join(File.dirname(__FILE__), APP_PATH)
end
 
def server_url
  "http://0.0.0.0:4723/wd/hub"
end
 
def selenium

  capabilities = {
    'platformVersion' => '4.2',
    'app' => APP_PATH,
    'platformName' => 'Android',
    'deviceName' => 'Android',
    'appPackage' => 'com.example.appiumtestdummyapp',
    'appActivity' => 'HomeActivity'
  }

  @driver ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url)
end

#selenium
 
# Before {
#   exec("emulator -avd appiumtest")

#   exec("event send EV_KEY:KEY_SOFT1:1 | nc localhost 5554")
#   exec("sleep 0.1")
#   exec("event send EV_KEY:KEY_SOFT1:0 | nc localhost 5554")
#   exec("sleep 0.1")
#   exec("event send EV_KEY:KEY_SOFT1:1 | nc localhost 5554")
#   exec("sleep 0.1")
#   exec("event send EV_KEY:KEY_SOFT1:0 | nc localhost 5554")
#   exec("sleep 0.1")
# }
After { @driver.quit }