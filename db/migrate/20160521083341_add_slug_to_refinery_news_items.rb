class AddSlugToRefineryNewsItems < ActiveRecord::Migration
  def change
    add_column :refinery_news_items, :slug, :string
    add_index :refinery_news_items, :slug
  end
end
