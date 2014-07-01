Given(/^I have App running with appium$/) do
 # Make sure you have started appium server 
 #selenium
end
 
When(/^touch "(.*?)" button$/) do |arg|
  selenium.find_element(:name, arg).click
end
 
When(/^I enter "(.*?)" into the "(.*?)" input field$/) do |data,fieldName|
 
selenium.find_element(:name, fieldName).send_keys data
#selenium.find_element(:name, "save").click
end

When(/^I touch "(.*?)" button$/) do |arg|
  selenium.find_element(:name, arg).click
end

# Then(/^I should see "(.*?)"$/) do |label|
# selenium.find_element(:name,  label).displayed?
# end 

Then(/^I should see "(.*?)" in list at item number 1$/) do |text|
note = selenium.find_element(:xpath,  "//android.view.View[1]/android.widget.FrameLayout[2]/android.widget.LinearLayout[1]/android.widget.ListView[1]/android.widget.LinearLayout[1]/android.widget.TextView[1]")
note.attribute("text").should match text 
end