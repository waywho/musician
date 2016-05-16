module Refinery
  module Productions
    module Admin
      class ProductionsController < ::Refinery::AdminController

        crudify :'refinery/productions/production'

        private

        # Only allow a trusted parameter "white list" through.
        def production_params
          params.require(:production).permit(:title, :feature_image_id, :company, :production_date, :description, images_attributes: [:id, :caption, :image_page_id])
        end
      end
    end
  end
end
