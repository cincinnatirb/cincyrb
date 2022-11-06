require "webmock/rspec"

driver_urls = Webdrivers::Common.subclasses.map(&:base_url)
driver_urls << /geckodriver/
driver_urls += ["github-releases.githubusercontent.com"] # this is added

WebMock.disable_net_connect!(allow_localhost: true, allow: driver_urls)
