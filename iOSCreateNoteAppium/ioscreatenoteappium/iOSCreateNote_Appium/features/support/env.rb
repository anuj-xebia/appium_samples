require 'rspec/expectations'
require 'selenium-webdriver'


# Before do

#   exec("/usr/local/bin/appium --no-reset &") 
#   exec("sleep 10")
#   exec("echo 'did it man'")
# end

APP_PATH = '/Users/Shared/Jenkins/workspace/iOSCreateNote/ioscreatenote/iOSCreateNote/build/Release-iphonesimulator/iOSCreateNote.app'
 
def absolute_app_path
  File.join(File.dirname(__FILE__), APP_PATH)
end
 
def server_url
  "http://0.0.0.0:4723/wd/hub"
end
 
def selenium

  capabilities = {
    'browserName' => 'iOS',
    'platform' => 'Mac',
    'version' => '7.1',
    'device' => 'iPhone Simulator',
    'app' => APP_PATH,
    'platformName' => 'iOS',
    'deviceName' => 'iPhone'
  }

  @driver ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url)
end

#selenium
 

After { @driver.quit }