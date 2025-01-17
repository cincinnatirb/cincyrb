class BlueskyFeedComponent < ViewComponent::Base
  include ActionView::Helpers::DateHelper

  def initialize(handle:, limit: 10)
    super
    @handle = handle
    @limit = limit
    @client = BlueskyClient.new
  end

  def posts
    return [] unless (did = @client.resolve_handle(@handle))

    @posts ||= begin
      feed = @client.get_author_feed(did, @limit)
      feed&.map { |post| parse_post(post) } || []
    rescue HTTParty::Error => e
      Rails.logger.error "Failed to fetch Bluesky feed: #{e.message}"
      []
    end
  end

  private

  def parse_post(post)
    record = post["post"]
    {
      text: record["record"]["text"],
      created_at: Time.zone.parse(record["record"]["createdAt"]),
      likes: record["likeCount"],
      reposts: record["repostCount"],
      replies: record["replyCount"],
      url: "https://bsky.app/profile/#{@handle}/post/#{record['uri'].split('/').last}"
    }
  end
end
