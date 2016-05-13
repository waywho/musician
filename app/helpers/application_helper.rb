module ApplicationHelper

	def navigation_menu
	  presenter = Refinery::Pages::MenuPresenter.new(refinery_menu_pages, self)
	  presenter.css = "menu-container"
	  presenter.menu_tag = :div
	  presenter.list_tag_css = "nav navbar-nav"
	  presenter.selected_css = "active"
	  presenter.first_css = ""
	  presenter.last_css = ""
	  presenter.max_depth = 0 # prevents dropdown menus, which don't render correctly
	  presenter
	end
end
