module Refinery
  module Contacts
    class ContactsController < ::ApplicationController

      before_action :find_all_contacts
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @contact in the line below:
        present(@page)
        @contact = Contact.new
      end

      def show
        @contact = Contact.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @contact in the line below:
        present(@page)
      end

      def send_contact
        Contact.create(contact_params)

        ContactMailer.contact_admin(contact_params).deliver_now
        ContactMailer.copy_sender(contact_params).deliver_now

        flash[:notice] = "Thank you! Your message is sent. We will be in touch as soon as possible."
        redirect_to refinery.contacts_contacts_path
      end

      def contact_sent
        @contact = Contact.new
      end

    protected

      def contact_params
        params.require(:contact).permit(:first_name, :surname, :email, :message)
      end

      def find_all_contacts
        @contacts = Contact.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/contacts").first
      end

    end
  end
end
