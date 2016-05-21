module Refinery
  module NewsItems
    module Admin
      class NewsItemsController < ::Refinery::AdminController

        crudify :'refinery/news_items/news_item',
                :title_attribute => 'headline'

        private

        # Only allow a trusted parameter "white list" through.
        def news_item_params
          params.require(:news_item).permit(:headline, :photo_id, :content, :publish_on)
        end
      end
    end
  end
end
