Refinery::PagesController.class_eval do
	before_action :find_all_unhidden_pages, :only => [:home]
	before_action :find_recent_news_item, :only => [:home]
	before_action :find_recent_productions, :only => [:home]

	protected
	def find_all_unhidden_pages
		@pages = Refinery::Page.where(show_in_menu: true)
	end

	def find_recent_news_item
		@news_items = Refinery::NewsItems::NewsItem.published.limit(5)
	end

	def find_recent_productions
		@productions = Refinery::Productions::Production.limit(6)
	end
end