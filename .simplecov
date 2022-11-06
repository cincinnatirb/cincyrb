SimpleCov.start 'rails' do
  add_filter ['lib/tasks', 'spec', 'vendor']
  add_group 'Channels', 'app/channels'
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
  add_group 'Views', 'app/views'
end
