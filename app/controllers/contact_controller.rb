class ContactController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])
    if @contact.invalid?
      messages = @contact.errors.full_messages.to_sentence
      render :json => { :errors => messages } , :status => :unprocessable_entity
    else
      ContactMailer.contact_email(@contact).deliver    
      render :json => { 
        :message => 'Your feedback has been submitted. We will reply as soon as possible.'
      }
    end
  end
end
