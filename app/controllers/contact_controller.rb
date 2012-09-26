class ContactController < ApplicationController
  #TODO: Should create a model to parse this stuff and validate, rather than doing it by hand
  #but need to research easiest/best way to create a non-ActiveRecord model
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
