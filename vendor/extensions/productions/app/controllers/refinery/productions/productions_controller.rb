module Refinery
  module Productions
    class ProductionsController < ::ApplicationController

      before_action :find_all_productions
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @production in the line below:
        present(@production)
      end

      def show
        @production = Production.friendly.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @production in the line below:
        present(@production)
      end

    protected

      def find_all_productions
        @productions = Production.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/productions").first
      end

    end
  end
end
