class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contacts_params)
        if @contact.save
            name = params[:contacts][:name]
            email = params[:contacts][:email]
            body = params[:contacts][:comments]
            ContactMailer.contacts_email(name, email, body).deliver
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
