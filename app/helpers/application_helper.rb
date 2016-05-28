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

	def footer_menu
  		menu_items = Refinery::Menu.new(Refinery::Page.footer_menu_pages)

  		Refinery::Pages::MenuPresenter.new(menu_items, self).tap do |presenter|
    		presenter.dom_id = "footer_menu"
    		presenter.css = "footer_menu"
    		presenter.menu_tag = :div
  		end
	end
end
