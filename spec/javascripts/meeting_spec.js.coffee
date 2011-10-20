#require meeting_model

describe "Meeting", ->
  it "should should have a description", ->
    meeting = new MeetingModel
    meeting.description = "foo"
    expect(meeting.description()).toEqual("foo")
