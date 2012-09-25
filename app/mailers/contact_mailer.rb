class ContactMailer < ActionMailer::Base

  default :to => "doug@therohrers.org"
  def contact_email(contact)
    @contact = contact
    mail(:from => @contact.email, :subject => "Feedback from cincyrb.com")
  end
end
