class CreateProductionsProductions < ActiveRecord::Migration

  def up
    create_table :refinery_productions do |t|
      t.string :title
      t.integer :feature_image_id
      t.string :company
      t.date :production_date
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-productions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/productions/productions"})
    end

    drop_table :refinery_productions

  end

end
