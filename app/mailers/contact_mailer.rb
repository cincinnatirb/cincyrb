class ContactMailer < ActionMailer::Base

  default :to => "doug@therohrers.org"
  def contact_email(name, email, topic, comment)
    @topic = topic
    @comment = comment
    @name = name
    logger.debug("topic: #{@topic}")
    mail(:from => email, :subject => "Feedback from cincyrb.com")
  end
end
