class ContactController < ApplicationController
  #TODO: Should create a model to parse this stuff and validate, rather than doing it by hand
  #but need to research easiest/best way to create a non-ActiveRecord model
  def create
    @name = params[:name]
    @email = params[:email]
    @subject = params[:subject]
    @message = params[:message]
    if (@name.blank? || @email.blank? || @subject.blank? || @message.blank?)
      @result = { 
        :message => "Please complete all fields in the contact form.",
        :success => false 
      }
    else
      ContactMailer.contact_email(@name, @email, @subject, @message).deliver    
      @result = { 
        :message => 'Your feedback has been submitted. We will reply as soon as possible.',
        :success => true 
      }
    end
    render :json => @result
  end
end
