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
      end

    protected

      def find_all_contacts
        @contacts = Contact.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/contacts").first
      end

    end
  end
end