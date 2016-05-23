module Refinery
  module Contacts
    module Admin
      class ContactsController < ::Refinery::AdminController


        crudify :'refinery/contacts/contact',
                :title_attribute => 'surname'

        private

        # Only allow a trusted parameter "white list" through.
        def contact_params
          params.require(:contact).permit(:first_name, :surname, :email, :message)
        end


      end
    end
  end
end
