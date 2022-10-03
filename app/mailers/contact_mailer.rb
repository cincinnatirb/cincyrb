class ContactMailer < ApplicationMailer
  default to: "cincinnatirb@googlegroups.com"

  def contact_email(contact)
    @contact = contact
    mail(from: @contact.email, subject: "Feedback from cincyrb.com")
  end
end
