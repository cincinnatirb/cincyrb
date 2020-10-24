require "rails_helper"

RSpec.describe "Past Events", type: :system do
  before do
    @speaker = create(:speaker, name: 'Jim Weirich')
    @past_event = create(:past_event, topic: 'A Really Cool Rails Feature', speakers: [@speaker])
    @video = create(:video, url: 'https://example.com/video/qwerty', past_event: @past_event)
  end

  scenario 'Visiting the Past Events page' do
    visit past_events_path

    expect(page).to have_text(@past_event.topic)

    expect(page).to have_selector('div.speakers')
    expect(page).to have_text(@speaker.name)

    expect(page).to have_selector('div.videos')
    expect(page).to have_selector("iframe[src='#{@video.url}']")
  end
end
