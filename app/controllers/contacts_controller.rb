class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contacts_params)
        if @contact.save
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            ContactMailer.contact_email(name, email, body).deliver
            flash[:success] = "Your message has been successfully delivered!"
            redirect_to root_path
        else
            flash[:danger] = @contact.errors.full_messages.join(",  ")
            redirect_to root_path
        end
    end
    
    private

    def contacts_params
        params.require(:contacts).permit(:name, :email, :comments)
    end    
end
