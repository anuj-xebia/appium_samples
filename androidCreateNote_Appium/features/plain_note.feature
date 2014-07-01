Feature: Notes 
  As an Android user
  I want PlainNote app
  So that I can make note of everything happening in my life
 
Scenario: Add new note
  Given I have App running with appium 
  When touch "newNote" button
  And I enter "some text" into the "tvNote" input field
  And I touch "saveButton" button
  Then I should see "some text" in list at item number 1