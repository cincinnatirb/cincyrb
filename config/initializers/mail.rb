ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: ENV.fetch('SENDGRID_USERNAME', nil),
  password: ENV.fetch('SENDGRID_PASSWORD', nil),
  domain: 'cincyrb.com'
}
ActionMailer::Base.delivery_method = :smtp
