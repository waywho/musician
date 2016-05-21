class AddSlugToProductions < ActiveRecord::Migration
  def change
  	add_column :refinery_productions, :slug, :string
  	add_index :refinery_productions, :slug
  end
end
