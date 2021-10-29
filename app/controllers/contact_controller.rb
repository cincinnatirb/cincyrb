class ContactController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      messages = @contact.errors.full_messages.to_sentence
      render json: { errors: messages }, status: :unprocessable_entity
    else
      ContactMailer.contact_email(@contact).deliver
      render json: { message: 'Your feedback has been submitted. We will reply as soon as possible.' }
  def index
    @contact = Pages.new(params[:pages])
  end

  def create
    @contact = Pages.new(params[:pages])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Pages.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Your feedback has been submitted. We will reply as soon as possible." }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message, :name, :subject)
  end
<<<<<<< Updated upstream
end
=======
  
end
>>>>>>> Stashed changes
