Refinery::PagesController.class_eval do
	before_action :find_all_unhidden_pages, :only => [:home]

	protected
	def find_all_unhidden_pages
		@pages = Refinery::Page.where(show_in_menu: true)
	end
end