class AddFeatureBooleanToRefineryProductions < ActiveRecord::Migration
  def change
    add_column :refinery_productions, :feature_production, :boolean
  end
end
