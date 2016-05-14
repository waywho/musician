class AddFeatureImageToRefineryPages < ActiveRecord::Migration
  def change
    add_column :refinery_pages, :feature_image_id, :integer
  end
end
