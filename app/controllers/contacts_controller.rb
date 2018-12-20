class ContactsController < ApplicationController
   

    def create
        @contact = Contact.new(params[:contact])
        @contact.request = request
        if @contact.deliver
            flash.now[:error] = nil
            redirect_to :about_me_path, notice: 'Thank you for sending me a message'
        else
            flash.now[:error] = 'Cannot send message.'
            redirect_to :about_me_path
        end
    end

end
