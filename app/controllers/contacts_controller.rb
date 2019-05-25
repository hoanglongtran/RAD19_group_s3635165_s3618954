class ContactsController < ApplicationController
def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(feedback_params)
    
    if @contact.save
      ContactsMailer.send_feedback(@contact).deliver
      redirect_to :courses
    else
      render :new
    end
  end

def thanks
  end
 private 
  def feedback_params
	params.require(:contact).permit(:name, :email, :message)
  end
end
