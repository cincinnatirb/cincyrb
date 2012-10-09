@past_events
Feature: Past Events
  As visitor to the site
  I want to be able to see what happen at past meetings
  In order not to miss any of the awesomeness.

  Scenario: Visiting the past events page
    Given I am on the homepage
    And there has recently been a cincy.rb event
    When I go to past events
    Then I should see a event topic
    And I should see a section for speakers
    And I should see a section for videos

 Scenario: Past events with specific information
   Given There is a past event with a topic of: "Hypermedia APIs"
   And the past event had a speaker with the name: "Steve Klabnik"
   And I there was a video recorded
   And I am on the homepage
   When I go to past events
   Then I should see the topic: "Hypermedia APIs"
   And I should see a speaker with the name: "Steve Klabnik"
   And I should see the video for the event
