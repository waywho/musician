# Open the Refinery::Admin::PagesController controller for manipulation
Refinery::Admin::PagesController.class_eval do
  def page_params_with_my_params
    page_params_without_my_params.merge(params.require(:page).permit(:feature_image_id))
  end
  alias_method_chain :page_params, :my_params
end