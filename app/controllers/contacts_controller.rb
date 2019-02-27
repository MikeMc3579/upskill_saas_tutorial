class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            redirect_to root_path 
        else
            redirect_to new_contact_path, notice: "Error Occured"
        end
    end
    
    private
    def contact_params
        params.require(:contact).permit(:firstname, :lastname, :email, :comments)
    end
end
