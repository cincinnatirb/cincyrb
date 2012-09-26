class ContactController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])
    if @contact.invalid?
      messages = ''
      @contact.errors.full_messages.each {|msg| messages +=  msg + "<br />"}
      @result = { 
        :message => messages,
        :success => false 
      }
    else
      ContactMailer.contact_email(@contact).deliver    
      @result = { 
        :message => 'Your feedback has been submitted. We will reply as soon as possible.',
        :success => true 
      }
    end
    render :json => @result
  end
end
