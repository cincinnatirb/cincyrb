class ContactForm < MailForm::Base

  default :to => "cincinnatirb@googlegroups.com"
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  def contact_email(contact)
    @contact = contact
    mail(:from => @contact.email, :subject => "Feedback from cincyrb.com")
  end

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Contact Form Inquiry",
      :to => "your_email@your_domain.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end
