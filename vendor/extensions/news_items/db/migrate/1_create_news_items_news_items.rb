class CreateNewsItemsNewsItems < ActiveRecord::Migration

  def up
    create_table :refinery_news_items do |t|
      t.string :headline
      t.integer :photo_id
      t.text :content
      t.datetime :publish_on
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-news_items"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/news_items/news_items"})
    end

    drop_table :refinery_news_items

  end

end
