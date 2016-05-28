# Open the Refinery::Page model for manipulation
Refinery::Page.class_eval do
  # Add an association to the Refinery::Image class, so we
  # can take advantage of the magic that the class provides
  belongs_to :feature_image, :class_name => '::Refinery::Image'

  def self.footer_menu_pages
  	where show_in_footer: true
  end
end