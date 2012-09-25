class ContactMailer < ActionMailer::Base

  default :to => "cincyrb@gaslightsoftware.com"
  def contact_email(contact)
    @contact = contact
    mail(:from => @contact.email, :subject => "Feedback from cincyrb.com")
  end
end
